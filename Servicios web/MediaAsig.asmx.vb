Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.SqlClient.SqlCommand
Imports System.Data.SqlClient

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class MediaAsig
    Inherits System.Web.Services.WebService

    Private Shared conexion As New SqlConnection

    <WebMethod()> _
    Public Function MediaDeHoras(codasig As String) As Double
        Dim com As New SqlCommand
        Dim st As String
        Dim numH As Double

        'Conectamos a la base de datos
        conectar()

        'Hacemos el query
        st = "Select AVG(EstudiantesTareas.HReales) FROM EstudiantesTareas inner join TareasGenericas on EstudiantesTareas.CodTarea = TareasGenericas.Codigo WHERE TareasGenericas.CodAsig = '" & codasig & "' group by TareasGenericas.CodAsig "
        com = New SqlCommand(st, conexion)
        numH = com.ExecuteScalar()
        'Cerramos conexión
        cerrarconexion()

        Return numH

    End Function

    Public Shared Function conectar() As String
        Try
            conexion.ConnectionString = "Data Source=tcp:hads13server.database.windows.net,1433;Initial Catalog=hads13db;User ID=hads13admin;Password=tigre.tigre13"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

End Class