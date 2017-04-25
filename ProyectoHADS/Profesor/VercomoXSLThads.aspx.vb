Public Class VercomoXSLT
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
    End Sub

    Protected Sub lbCodigo_Click(sender As Object, e As EventArgs) Handles lbCodigo.Click
        xmlHads1.TransformSource = (Server.MapPath("../App_Data/HadsCodigo.xslt"))
    End Sub

    Protected Sub lbDes_Click(sender As Object, e As EventArgs) Handles lbDes.Click
        xmlHads1.TransformSource = (Server.MapPath("../App_Data/HadsDescripcion.xslt"))
    End Sub

    Protected Sub lbHE_Click(sender As Object, e As EventArgs) Handles lbHE.Click
        xmlHads1.TransformSource = (Server.MapPath("../App_Data/HadsHestimadas.xslt"))
    End Sub
End Class