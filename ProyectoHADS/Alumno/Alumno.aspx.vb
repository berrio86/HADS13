Imports componenteCorreo.ComponenteCorreo

Public Class WebForm5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Tipo") = "Administrador" Then
            btnAdmin.Visible = True
        ElseIf Session("Tipo") = "Profesor" Then
            btnAdmin.Visible = False
        Else
            btnAdmin.Visible = False
        End If
    End Sub


    Protected Sub btnAdmin_Click(sender As Object, e As EventArgs) Handles btnAdmin.Click
        Response.Redirect("../Admin/Administrador.aspx")
    End Sub

    
End Class