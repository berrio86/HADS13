Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Public Shared listaProfesores As ArrayList = New ArrayList()
    Public Shared listaAlumnos As ArrayList = New ArrayList()
    Public Shared contador As Integer = 0
    Public Shared numProf As Integer = 0
    Public Shared numAl As Integer = 0
    Public Shared ultimoConectado As String = ""

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación

        Application.Contents("listaProfesores") = listaProfesores
        Application.Contents("listaAlumnos") = listaAlumnos
        Application.Contents("contador") = contador
        Application.Contents("ultimoConectado") = ultimoConectado
        Application.Contents("numAl") = numAl
        Application.Contents("numProf") = numProf
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
        'Application.Lock()
        'Dim CONT As Integer = Application.Contents("contador")
        'CONT = Application.Contents("contador") + 1
        'Application.Contents("contador") = CONT
        'Application.Contents("ultimoConectado") = Session("Email")
        'If Session("Tipo") = "Profesor" Then
        ' listaProfesores.Add(Session("Email"))
        ' Application.Contents("listaProfesores") = listaProfesores
        ' End If
        ' If Session("Tipo") = "Alumno" Then
        ' listaAlumnos.Add(Session("Email"))
        ' Application.Contents("listaAlumnos") = listaAlumnos
        ' End If
        ' Application.UnLock()
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
        'Application.Lock()
        'Dim CONT As Integer = Application.Contents("contador")
        'CONT = Application.Contents("contador") - 1
        'Application.Contents("contador") = CONT
        'Application.UnLock()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class