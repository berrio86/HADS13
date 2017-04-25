Public Class menuProfesor
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lbTareas_Click(sender As Object, e As EventArgs) Handles lbTareas.Click
        Response.Redirect("TareasProfesor.aspx")
    End Sub

    Protected Sub lbInsertar_Click(sender As Object, e As EventArgs) Handles lbInsertar.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub

    Protected Sub lbEstadis_Click(sender As Object, e As EventArgs) Handles lbEstadis.Click
        Response.Redirect("VerEstadisticas.aspx")
    End Sub

    Protected Sub lbImportXML_Click(sender As Object, e As EventArgs) Handles lbImportXML.Click
        Response.Redirect("ImportarTareasXMLDocument.aspx")
    End Sub

    Protected Sub lbExportar_Click(sender As Object, e As EventArgs) Handles lbExportar.Click
        Response.Redirect("ExportarTareas.aspx")
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("ImportarTareasDataset.aspx")
    End Sub

    Protected Sub lbXSLT_Click(sender As Object, e As EventArgs) Handles lbXSLT.Click
        Response.Redirect("VercomoXSLThads.aspx")
    End Sub

    Protected Sub lbAlum_Click(sender As Object, e As EventArgs) Handles lbAlum.Click
        Response.Redirect("/Alumno/Alumno.aspx")
    End Sub

    Protected Sub lbCoordinador_Click(sender As Object, e As EventArgs) Handles lbCoordinador.Click
        Response.Redirect("Coordinador.aspx")
    End Sub
End Class