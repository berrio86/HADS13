Public Class menuAlumno
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lbTareas_Click(sender As Object, e As EventArgs) Handles lbTareas.Click
        Response.Redirect("TareasAlumno.aspx")
    End Sub
End Class