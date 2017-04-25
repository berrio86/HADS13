Imports conexionDB.accesodatosSQL
Imports componenteCorreo.ComponenteCorreo
Imports System.Web.Security.FormsAuthentication
Imports System.Security.Cryptography

Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub enviar_Click(sender As Object, e As EventArgs) Handles enviar.Click
        Dim num_conf As Integer
        Dim emailEnvio As String
        Dim inicio As String = "<p>Hola " + nombre.Text + ";</p>" + "<p>Bienvenido a nuestra web. Tu peteción de registro está siendo procesada. Para terminar el proceso de registro pulsa en el link que hay más abajo.</p>"
        Dim link As String
        Dim final As String = "<p>Muchas gracias por registrarte</p><p>Un saludo de parte de los administrarores</p>"
        Dim asunto As String = "Registro web"
        Dim comp As New matriculas.Matriculas


        Randomize()
        num_conf = CLng(Rnd() * 9000000) + 1000000
        If comp.comprobar(email.Text) = "NO" Then
            MsgBox("El usuario con el correo " + email.Text + " no esta matriculado")
        Else
            emailEnvio = email.Text
            link = "http://proyectohads13.azurewebsites.net/confirmar.aspx?email=" + emailEnvio + "&numconf=" + System.Convert.ToString(num_conf)
            ' Encriptar contraseña
            Dim md5Hash As MD5 = MD5.Create()
            Dim hash As String = obtenerHashMd5(md5Hash, password1.Text)

            conectar()
            resultadoDB.Text = insertarUsuarios(email.Text, nombre.Text, apellido1.Text, pregunta.SelectedValue, respuesta.Text, dni.Text, num_conf, hash)
            cerrarconexion()
            link = "<a href='" + link + "'>Pulsa aquí para confirmar el registro</a>"
            If resultadoDB.Text = "1 registro(s) insertado(s) en la BD " Then
                enviarEmail(emailEnvio, asunto, inicio + link + final)
            End If
        End If

    End Sub
    Shared Function obtenerHashMd5(ByVal md5Hash As MD5, ByVal input As String) As String

        'Convertir la entrada en un array bidimensional de bytes y computar el hash 
        Dim data As Byte() = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input))

        ' Crear un string
        Dim sBuilder As New StringBuilder()

        'Hacer un bucle, que por cada byte del hash se añade al string en formato hexadecimal
        Dim i As Integer
        For i = 0 To data.Length - 1
            sBuilder.Append(data(i).ToString("x2"))
        Next i

        ' Devolver el string hexadecimal
        Return sBuilder.ToString()

    End Function


End Class