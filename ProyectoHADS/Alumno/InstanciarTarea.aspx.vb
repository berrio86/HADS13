Imports conexionDB.accesodatosSQL

Public Class InstanciarTarea
    Inherits System.Web.UI.Page
    Private Shared dtabla As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
         If Not Page.IsPostBack Then
            'conectar()
            'Dim tabla As New DataTable
            'tabla = obtenerTareasRealizadasAlumno(Session("Email"))
            tbUsuario.Text = Session("Email")
            tbTarea.Text = Request.QueryString("codigo")
            tbHorasEst.Text = Request.QueryString("horas")
            'gvTareasRealizadas.DataSource = tabla
            'gvTareasRealizadas.DataBind()
            'cerrarconexion()
        Else

        End If
    End Sub


    Protected Sub lbAnterior_Click(sender As Object, e As EventArgs) Handles lbAnterior.Click
        Response.Redirect("TareasAlumno.aspx")
    End Sub

    Protected Sub btnCrearTarea_Click(sender As Object, e As EventArgs) Handles btnCrearTarea.Click
        'Dim dtabla As New DataTable
        'Dim row As DataRow = dtabla.NewRow
        Try
            
            'dtabla.Rows.Add(row)
            lblRespuesta.Text = actualizarTablaTareas(tbUsuario.Text, tbTarea.Text, tbHorasEst.Text, tbHorasReales.Text, Session("Email"))
        Catch ex As Exception
            lblRespuesta.ForeColor = Drawing.Color.Red
            lblRespuesta.Text = "Ha habido un error: " & ex.Message
        End Try
        lblRespuesta.ForeColor = Drawing.Color.Green
        lblRespuesta.Text = "La tarea ha sido instanciada"
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvTareasRealizadas.SelectedIndexChanged

    End Sub


End Class