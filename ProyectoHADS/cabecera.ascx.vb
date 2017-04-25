Imports System.Web.Security.FormsAuthentication

Public Class cabecera
    Inherits System.Web.UI.UserControl

    Dim lblTipo As Object
    Dim lblEmail As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session.Item("Email") Is Nothing) Then
            Response.Redirect("../Inicio.aspx")
        Else
            lbemail.Text = Session.Item("Email")
            lbtipo.Text = Session.Item("Tipo")
        End If
    End Sub



    Protected Sub btlog_Click(sender As Object, e As EventArgs) Handles btlog.Click
        Application.Lock()
        If Session("Tipo") = "Profesor" Then
            Application.Contents("listaProfesores").remove(Session("Email"))
            Application.Contents("numProf") = Application.Contents("numProf") - 1
        ElseIf Session("Tipo") = "Alumno" Then
            Application.Contents("listaAlumnos").remove(Session("Email"))
            Application.Contents("numAl") = Application.Contents("numAl") - 1
        End If
        Application.Contents("contador") = Application.Contents("contador") - 1
        Application.UnLock()
        Session.Abandon()
        SignOut()
        Response.Redirect("../Inicio.aspx")
    End Sub
End Class