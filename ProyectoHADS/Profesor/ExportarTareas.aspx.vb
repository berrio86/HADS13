Imports System.Xml
Imports System.IO
Imports conexionDB.accesodatosSQL


Public Class ExportarTareas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btXML_Click(sender As Object, e As EventArgs) Handles btXML.Click

        Try
            'obtener tareas de la db
            Dim dt As DataTable

            dt = obtenerTareasAsignatura(ddAsigna.SelectedValue)
            'Asignar nombres a dataset y datatable
            dt.DataSet.DataSetName = "tareas"
            dt.TableName = "tarea"
            dt.Columns.Remove("CodAsig")

            dt.Columns(0).ColumnName = "codigo"
            dt.Columns(1).ColumnName = "descripcion"
            dt.Columns(2).ColumnName = "hestimadas"
            dt.Columns(3).ColumnName = "explotacion"
            dt.Columns(4).ColumnName = "tipotarea"

            'Crear xml
            dt.WriteXml(Server.MapPath("App_Data/" & ddAsigna.SelectedValue & ".xml"))
            'añadir atributo
            Dim xd As New XmlDocument
            xd.Load(Server.MapPath("App_Data/" & ddAsigna.SelectedValue & ".xml"))
            Dim tareas As XmlNode = xd.DocumentElement
            Dim at As XmlAttribute = xd.CreateAttribute("xmlns:has")
            'texto del atributo
            Dim xt As XmlText
            xt = xd.CreateTextNode("http://ji.ehu.es/has")
            at.AppendChild(xt)
            tareas.Attributes.Append(at)
            'xd.DocumentElement.AppendChild(tareas)
            xd.Save(Server.MapPath("App_Data/" & ddAsigna.SelectedValue & ".xml"))
            lblMensje.Text = "El archivo se ha extraido correctamente en formato XML"

        Catch ex As Exception
            lblMensje.Text = "No se ha podido exportar el archivo .xml o ya existe"
        End Try

    End Sub

    Protected Sub btJSON_Click(sender As Object, e As EventArgs) Handles btJSON.Click
        Try
            'obtener tareas de la db
            Dim dt As DataTable
            dt = obtenerTareasAsignatura(ddAsigna.SelectedValue)
            dt.TableName = "tarea"

            'Serializar en formato json
            Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
            Dim rows As New List(Of Dictionary(Of String, Object))()
            Dim row As Dictionary(Of String, Object) = Nothing
            For Each dr As DataRow In dt.Rows
                row = New Dictionary(Of String, Object)()
                For Each dc As DataColumn In dt.Columns
                    row.Add(dc.ColumnName.Trim(), dr(dc))
                Next
                rows.Add(row)
            Next

            'Escribirlo en un texto
            lblMensje.Text = "Los datos se han exportado a .json de forma correcta"
            File.WriteAllText(Server.MapPath("App_Data/" & ddAsigna.SelectedValue & ".json"), serializer.Serialize(rows))

        Catch ex As Exception
            lblMensje.Text = "No se ha podido exportar el archivo .json o ya existe"
        End Try

    End Sub
End Class