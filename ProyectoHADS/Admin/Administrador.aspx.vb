Imports conexionDB.accesodatosSQL
Public Class Administrador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvUsuarios.SelectedIndexChanged
        lblConfirmacion.Visible = True
        btnSI.Visible = True
        btnNo.Visible = True


    End Sub

  

    Protected Sub btnSI_Click(sender As Object, e As EventArgs) Handles btnSI.Click
        Dim row As GridViewRow = gvUsuarios.SelectedRow
        lbMensaje.Text = eliminarUsuario(row.Cells(1).Text)
        gvUsuarios.DataBind()
        lblConfirmacion.Visible = False
        btnSI.Visible = False
        btnNo.Visible = False
    End Sub

    Protected Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        lblConfirmacion.Visible = False
        btnSI.Visible = False
        btnNo.Visible = False
    End Sub

   
    Protected Sub lbProf_Click(sender As Object, e As EventArgs) Handles lbProf.Click
        Response.Redirect("/Profesor/Profesor.aspx")
    End Sub

    Protected Sub lbAlum_Click(sender As Object, e As EventArgs) Handles lbAlum.Click
        Response.Redirect("/Alumno/Alumno.aspx")
    End Sub
End Class