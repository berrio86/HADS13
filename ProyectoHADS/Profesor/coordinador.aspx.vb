
Public Class coordinador
    Inherits System.Web.UI.Page
    Dim media As New Servicios_web.MediaAsig
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub

    Private Sub ddAsig_DataBound(sender As Object, e As EventArgs) Handles ddAsig.DataBound
        lbMedia.Text = media.MediaDeHoras(ddAsig.SelectedItem.Value)
    End Sub

    Protected Sub ddAsig_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddAsig.SelectedIndexChanged
        lbMedia.Text = media.MediaDeHoras(ddAsig.SelectedItem.Value)
    End Sub

    Protected Sub sqldsAsig_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles sqldsAsig.Selecting

    End Sub
End Class