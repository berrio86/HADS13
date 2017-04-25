Imports conexionDB.accesodatosSQL

Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Request.QueryString("email")
        lblEmail.Text = email
        'Llamar para escribir pregunta secreta
        conectar()
        lblPreguntaSecreta.Text = recuperarPreguntaSecreta(email)
        cerrarconexion()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles ButtonComprobar.Click
        conectar()
        If comprobarPreguntaSecreta(lblEmail.Text, respuesta.Text) = 1 Then
            Pass1.Visible = True
            Pass2.Visible = True
            ButtonCambiar.Visible = True
            Label2.Text = "Nueva contraseña"
            Label2.Visible = True
            Label3.Visible = True
            valReq1.Enabled = True
            valReq2.Enabled = True
            valCar1.Enabled = True
            valEq1.Enabled = True
        Else
            Label2.Text = "La respuesta no es correcta."
            Label2.Visible = True
        End If
        cerrarconexion()
    End Sub

    Protected Sub ButtonCambiar_Click(sender As Object, e As EventArgs) Handles ButtonCambiar.Click
        conectar()
        lblRespuesta.Text = conexionDB.accesodatosSQL.cambiarPassword(Pass1.Text, lblEmail.Text)
        cerrarconexion()
    End Sub

    
End Class