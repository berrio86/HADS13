Public Class footer
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUsuario.Text = Application.Contents("ultimoConectado")
        lbCount.Text = Application.Contents("contador").ToString

        lbAlumnos.DataSource = Application.Contents("listaAlumnos")
        lbProfesores.DataSource = Application.Contents("listaProfesores")
        lbAlumnos.DataBind()
        lbProfesores.DataBind()
    End Sub

    
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        lbAlumnos.Items.Clear()
        lbProfesores.Items.Clear()
        lblUsuario.Text = Application.Contents("ultimoConectado")
        lbCount.Text = Application.Contents("contador").ToString
        lbAlumnos.DataSource = Application.Contents("listaAlumnos")
        lbProfesores.DataSource = Application.Contents("listaProfesores")
        lbAlumnos.DataBind()
        lbProfesores.DataBind()
    End Sub


    
End Class