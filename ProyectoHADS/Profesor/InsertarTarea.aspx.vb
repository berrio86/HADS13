Imports conexionDB.accesodatosSQL
Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btAdd_Click(sender As Object, e As EventArgs) Handles btAdd.Click
        conectar()
        lbDBOK.Text = conexionDB.accesodatosSQL.insertarTarea(tbCod.Text, tbDesc.Text, ddAsig.SelectedValue, tbHoras.Text, ddTipo.SelectedValue)
        cerrarconexion()

    End Sub

  
End Class