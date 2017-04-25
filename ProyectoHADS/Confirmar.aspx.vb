Imports conexionDB.accesodatosSQL
Imports System.Net

Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Request.QueryString("email")
        Dim numconf As Integer = Request.QueryString("numconf")


        lblResultadoEmail.Text = "Direccion de correo: " + email
        lblResultadoNumconf.Text = "Numero de confirmacion: " + System.Convert.ToString(numconf)
        conectar()
        If mirarConfirmacion(email, numconf) = 1 Then
            cambiarConfirmado(email)
            lblRespuesta.ForeColor = Drawing.Color.Green
            lblRespuesta.Text = "TE HAS REGISTRADO CON EXITO!!!"
        Else
            lblRespuesta.ForeColor = Drawing.Color.Red
            lblRespuesta.Text = "Ha habido un error en el proceso de resgitro. Por favor, pongase en contacto con el administrador."
        End If
        cerrarconexion()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class