Public Class WebForm6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
    End Sub

    



    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub



    Protected Sub btInsert_Click(sender As Object, e As EventArgs) Handles btInsert.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub

    Protected Sub ddProfesor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddProfesor.SelectedIndexChanged
        GridView1.DataBind()
    End Sub
End Class