Imports conexionDB.accesodatosSQL
Imports System.Web.Security.FormsAuthentication
Imports System.Security.Cryptography

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim correo As String = email.Text
        Dim contrasena As String = password.Text
        Dim md5Hash As MD5 = MD5.Create()
        Dim hash As String = obtenerHashMd5(md5Hash, contrasena)
        'MsgBox(hash, MsgBoxStyle.OkOnly)
        conectar()

        If conexionDB.accesodatosSQL.login(correo, hash) = 1 Then
            Session("Email") = correo
            If comprobarTipo(correo) = "Admin" Then
                Session("Tipo") = "Administrador"
                SetAuthCookie("admin", False)
                Response.Redirect("Admin/Administrador.aspx")
            ElseIf comprobarTipo(correo) = "P" Then
                Session("Tipo") = "Profesor"
                SetAuthCookie(correo, False)
                Application.Lock()
                Application.Contents("contador") = Application.Contents("contador") + 1
                Application.Contents("numProf") = Application.Contents("numProf") + 1
                Application.Contents("ultimoConectado") = correo
                Application.Contents("listaProfesores").add(correo)
                Application.UnLock()
                Response.Redirect("Profesor/Profesor.aspx")
            Else
                Session("Tipo") = "Alumno"
                SetAuthCookie("alumno", False)
                Application.Lock()
                Application.Contents("contador") = Application.Contents("contador") + 1
                Application.Contents("numAl") = Application.Contents("numAl") + 1
                Application.Contents("ultimoConectado") = correo
                Application.Contents("listaAlumnos").add(correo)
                Application.UnLock()
                Response.Redirect("Alumno/Alumno.aspx")
            End If
        Else
            lblRespuesta.Text = "Datos no validos. Intentalo de nuevo"
        End If
            cerrarconexion()
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

