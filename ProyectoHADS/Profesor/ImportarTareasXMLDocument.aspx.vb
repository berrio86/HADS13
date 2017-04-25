Imports System.Xml
Imports System.IO
Imports conexionDB.accesodatosSQL

Public Class WebForm7
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btImportar_Click(sender As Object, e As EventArgs) Handles btImportar.Click
        Dim filepath As String = Server.MapPath("App_Data/" & ddAsignatura.SelectedValue & ".xml")
        If (File.Exists(filepath)) Then
            lbMensaje.Visible = False
            'Obtener tareas de la base de datos
            Dim dt As DataTable
            dt = obtenerTareasGenericas()

            'Obtener xml
            Dim docxml As New XmlDocument
            docxml.Load(filepath)

            'Introducir xml en la datatable
            Dim tareas As XmlNodeList
            tareas = docxml.GetElementsByTagName("tarea")
            Dim x = 0
            For i = 0 To tareas.Count - 1
                Dim row As DataRow = dt.NewRow
                row("Codigo") = tareas(i).ChildNodes(0).ChildNodes(0).Value
                row("Descripcion") = tareas(i).ChildNodes(1).ChildNodes(0).Value
                row("CodAsig") = ddAsignatura.SelectedValue
                row("HEstimadas") = tareas(i).ChildNodes(2).ChildNodes(0).Value
                row("Explotacion") = tareas(i).ChildNodes(3).ChildNodes(0).Value
                row("TipoTarea") = tareas(i).ChildNodes(4).ChildNodes(0).Value
                Dim st As String
                st = llenarTareasGenericasDeXML(row)
                If Not st = "Se ha actualizado la BD con archivo xml de forma correcta" Then
                    MsgBox(st, MsgBoxStyle.OkOnly)
                    x = x + 1
                    'MsgBox.Show(st, "Error con la BD", MsgBoxStyle.OkOnly, MessageBoxIcon.Asterisk)
                End If
            Next
            If x = 0 Then
                lbMensaje.Visible = True
                lbMensaje.ForeColor = Drawing.Color.Green
                lbMensaje.Text = "Todos los registros del fichero xml han sido introducidos correctamente"
            Else
                lbMensaje.Visible = True
                lbMensaje.ForeColor = Drawing.Color.Red
                lbMensaje.Text = "Ha habido un error al introducir algun(as) tarea(s) del fichero xml"
            End If

        Else
            lbMensaje.Visible = True
            lbMensaje.ForeColor = Drawing.Color.Red
            lbMensaje.Text = "No hay ningun xml seleccionado"
        End If

    End Sub

    Protected Sub cargarXML()
        Dim filepath As String = Server.MapPath("App_Data/" & ddAsignatura.SelectedValue & ".xml")
        If (File.Exists(filepath)) Then
            Xml1.DocumentSource = filepath
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
            lbMensaje.Visible = False
        Else
            lbMensaje.Text = "La asignatura no cuenta con un fichero XML propio"
            lbMensaje.ForeColor = Drawing.Color.Red
            lbMensaje.Visible = True
        End If
    End Sub

   
    Private Sub ddAsignatura_DataBound(sender As Object, e As EventArgs) Handles ddAsignatura.DataBound
        cargarXML()
    End Sub

    Protected Sub ddAsignatura_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddAsignatura.SelectedIndexChanged
        cargarXML()
    End Sub
End Class