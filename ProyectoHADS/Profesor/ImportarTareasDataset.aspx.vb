Imports System.Xml
Imports System.IO
Imports conexionDB.accesodatosSQL

Public Class ImportarTareasDataset
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btImport_Click(sender As Object, e As EventArgs) Handles btImport.Click
        Dim filepath As String = Server.MapPath("App_Data/" & ddAsig.SelectedValue & ".xml")
        If (File.Exists(filepath)) Then
            lblMensaje.Visible = False

            'Obtener tareas de la base de datos
            Dim dt As DataTable
            dt = obtenerTareasGenericas()

            'Cargar datos xml en un datatable
            Dim ds As DataSet = New DataSet()
            Dim dt2 As DataTable
            ds.ReadXml(filepath)
            dt2 = ds.Tables(0)
            Dim x = 0
            For i = 0 To dt2.Rows.Count - 1
                Dim row As DataRow = dt.NewRow
                row("Codigo") = dt2.Rows(i).Item("codigo")
                row("Descripcion") = dt2.Rows(i).Item("descripcion")
                row("CodAsig") = ddAsig.SelectedValue
                row("HEstimadas") = dt2.Rows(i).Item("hestimadas")
                row("Explotacion") = dt2.Rows(i).Item("explotacion")
                row("TipoTarea") = dt2.Rows(i).Item("tipotarea")
                Dim st As String
                st = llenarTareasGenericasDeXML(row)
                If Not st = "Se ha actualizado la BD con archivo xml de forma correcta" Then
                    MsgBox(st, MsgBoxStyle.OkOnly)
                    x = x + 1
                    'MsgBox.Show(st, "Error con la BD", MsgBoxStyle.OkOnly, MessageBoxIcon.Asterisk)
                End If

            Next
            If x = 0 Then
                lblMensaje.Visible = True
                lblMensaje.ForeColor = Drawing.Color.Green
                lblMensaje.Text = "Todos los registros del fichero xml han sido introducidos correctamente"
            Else
                lblMensaje.Visible = True
                lblMensaje.ForeColor = Drawing.Color.Red
                lblMensaje.Text = "Ha habido un error al introducir algun(as) tarea(s) del fichero xml"
            End If

            
        Else
            lblMensaje.Visible = True
            lblMensaje.ForeColor = Drawing.Color.Red
            lblMensaje.Text = "No hay ningun xml seleccionado"
        End If
    End Sub

    Protected Sub cargarXML()
        Dim filepath As String = Server.MapPath("App_Data/" & ddAsig.SelectedValue & ".xml")
        If (File.Exists(filepath)) Then
            Xml1.DocumentSource = filepath
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
            lblMensaje.Visible = False
        Else
            lblMensaje.Visible = True
            lblMensaje.ForeColor = Drawing.Color.Red
            lblMensaje.Text = "La asignatura no cuenta con un fichero XML propio"
        End If
    End Sub

    Private Sub ddAsig_DataBound(sender As Object, e As EventArgs) Handles ddAsig.DataBound
        cargarXML()
    End Sub

    Protected Sub ddAsig_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddAsig.SelectedIndexChanged
        cargarXML()
    End Sub
End Class