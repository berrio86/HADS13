Imports conexionDB.accesodatosSQL
Imports System.Data.SqlClient


Public Class TareasAlumno
    Inherits System.Web.UI.Page

    Private Shared dtable As New DataTable
    Private Shared dtable2 As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            conectar()
            dtable = obtenerCodAsig(Session("Email"))
            ddAsignaturas.DataSource = dtable
            ddAsignaturas.DataTextField = "codigoasig"
            ddAsignaturas.DataBind()

            dtable2 = obtenerTareasSinRealizarAlumno(ddAsignaturas.SelectedValue, Session("Email"), dtable)
            Session("desplegable") = dtable
            Session("tabla") = dtable2
            seleccionarTareas(dtable2)
            'gvTareas.DataSource = dtable2
            'gvTareas.DataBind()
            cerrarconexion()
        Else
            'aqui se deberian hacer los cambios para pillar los datos correspondientes
            'del dataTable, no??

            
        End If
    End Sub

    Protected Sub seleccionarTareas(ByVal dt As DataTable)
        Dim expresion As String = "CodAsig = '" & ddAsignaturas.SelectedValue & "'"
        Dim dv As DataView = New DataView(dt, expresion, "Codigo", DataViewRowState.CurrentRows)
        If dt IsNot Nothing Then

            gvTareas.DataSource = dv
            gvTareas.DataBind()
        End If
        If dv.Count = 0 Then
            gvTareas.Visible = False
            lblRespuesta.Text = "No hay tareas de esa asignatura"
        End If
    End Sub

    Protected Sub ddAsignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddAsignaturas.SelectedIndexChanged
        Dim dt = TryCast(Session("tabla"), DataTable)
        seleccionarTareas(dt)
    End Sub



    Protected Sub gvTareas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvTareas.SelectedIndexChanged
        Dim row As GridViewRow = gvTareas.SelectedRow
        Response.Redirect("InstanciarTarea.aspx?codigo=" & row.Cells(1).Text & "&horas=" & row.Cells(3).Text)
    End Sub


    'Ordenando la vista
    Protected Sub gvTareas_Sorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs) Handles gvTareas.Sorting
        Dim dt = TryCast(Session("tabla"), DataTable)

        If dt IsNot Nothing Then
            dt.DefaultView.Sort = e.SortExpression & " " & GetSortDirection(e.SortExpression)
            gvTareas.DataSource = Session("tabla")
            gvTareas.DataBind()
        End If
    End Sub

    Private Function GetSortDirection(ByVal column As String) As String
        Dim sortDirection = "ASC"
        Dim sortExpression = TryCast(ViewState("SortExpression"), String)

        If sortExpression IsNot Nothing Then
            If sortExpression = column Then
                Dim lastDirection = TryCast(ViewState("SortDirection"), String)
                If lastDirection IsNot Nothing _
                    AndAlso lastDirection = "ASC" Then
                    sortDirection = "DESC"
                End If
            End If
        End If

        ViewState("SortDirection") = sortDirection
        ViewState("SortExpression") = column

        Return sortDirection

    End Function

   
End Class