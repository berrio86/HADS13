Imports componenteCorreo.ComponenteCorreo
Imports conexionDB.accesodatosSQL

Public Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim email As String
        Dim inicio As String
        Dim link As String
        Dim final As String
        Dim asunto As String
        Dim resultado As Boolean

        email = correo.Text
        asunto = "Cambio de contraseña"
        inicio = "<p>Hola " + email + "; </p><p>Hemos recibido una petición de cambio de contraseña para cambiar la contraseña. Para terminar este proceso haz click en el siguiente enlace:</p>"
        link = "http://proyectohads13.azurewebsites.net/CambiarPassword2.aspx?email=" + email
        link = "<a href='" + link + "'>cambiar correo</a>"
        final = "<p>Muchas gracias</p><p>Un saludo del equipo tecnico HADS13</p>"

        'Mirar si esta en la base de datos. En caso de que esté enviar email, si no, nada. (implementar más adelante)
        conectar()
        If existeCorreo(email) = 1 Then
            resultado = enviarEmail(email, asunto, inicio + link + final)
            If (resultado = True) Then
                lblResultado.ForeColor = Drawing.Color.Green
                lblResultado.Text = "El correo se ha enviado con exito."
            Else
                lblResultado.ForeColor = Drawing.Color.Red
                lblResultado.Text = "Ha habido un problema al enviar el correo. Pongase en contacto con el equipo técnico."
            End If
        Else
            lblResultado.ForeColor = Drawing.Color.Red
            lblResultado.Text = "Ese correo no esta en la base de datos."
        End If
        cerrarconexion()
    End Sub

    
End Class