Imports System.Data.SqlClient.SqlConnection
Imports System.Data.SqlClient.SqlCommand
Imports System.Data.SqlClient

Public Class accesodatosSQL

    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Private Shared daTareasGenericas As New SqlDataAdapter("SELECT * FROM TareasGenericas", conexion)
    Private Shared dsTareasGenericas As New DataSet
    Private Shared bldTareasGenericas As New SqlCommandBuilder(daTareasGenericas)

    Private Shared daTareasInstanciar As SqlDataAdapter
    Private Shared dsTareasInstanciar As DataSet

    Private Shared Property dr As SqlDataReader




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

    Public Shared Function insertarUsuarios(ByVal email As String, ByVal nombre As String, ByVal apellido1 As String,
                                            ByVal pregunta As String, ByVal respuesta As String, ByVal dni As String,
                                            ByVal numconfir As Integer, ByVal password As String) As String
        Dim st = "insert into Usuarios (email,nombre,apellidos,pregunta,respuesta,dni,numconfir,confirmado,pass) values ('" & email & " ','" & nombre & " ','" & apellido1 & " ','" & pregunta & " ','" & respuesta & " ','" & dni & " ','" & numconfir & " ', 0,'" & password & " ')"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return (numregs & " registro(s) insertado(s) en la BD ")
    End Function


    Public Shared Function cambiarPassword(ByVal password As String, ByVal email As String) As String
        Dim st = "UPDATE Usuarios SET pass='" & password & "' WHERE email = '" & email & " '"
        comando = New SqlCommand(st, conexion)
        Dim numregs As Integer
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return (numregs & " registro(s) cambiado(s) en la BD ")
    End Function

    Public Shared Function login(ByVal email As String, ByVal password As String) As String
        Dim st = "SELECT count(*) from Usuarios WHERE email = '" & email & " ' AND pass = '" & password & " ' AND confirmado = 1"
        comando = New SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function comprobarTipo(ByVal email As String) As String
        Dim st = "SELECT tipo FROM Usuarios WHERE email='" & email & " ' "
        Dim respuesta As String
        comando = New SqlCommand(st, conexion)
        dr = comando.ExecuteReader()
        If dr.Read() = True Then
            respuesta = dr.Item(0)
        Else
            respuesta = "No se ha podido leer nada de la base de datos"
        End If
        dr.Close()
        Return respuesta
    End Function
    

    Public Shared Function existeCorreo(ByVal email As String) As String
        Dim st As String
        'Mirar si email y numconf concuerdan
        st = "SELECT count(*) from Usuarios WHERE email ='" & email & " ' "
        comando = New SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function mirarConfirmacion(ByVal email As String, ByVal numconf As Integer) As String
        Dim st As String
        'Mirar si email y numconf concuerdan
        st = "SELECT count(*) from Usuarios WHERE email ='" & email & " ' AND numconfir=" & numconf
        comando = New SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function cambiarConfirmado(ByVal email As String) As String
        Dim numregs As Integer
        Dim st As String
        st = "Update Usuarios SET confirmado=1 WHERE email='" & email & " ' "
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return (numregs & " registro(s) cambiado(s) en la BD ")
    End Function

    Public Shared Function recuperarPreguntaSecreta(ByVal email As String) As String
        Dim st = "SELECT pregunta FROM Usuarios WHERE email='" & email & " ' "
        Dim respuesta As String
        comando = New SqlCommand(st, conexion)
        dr = comando.ExecuteReader()
        If dr.Read() = True Then
            respuesta = dr.Item(0)
        Else
            respuesta = "No se ha podido leer nada de la base de datos"
        End If
        dr.Close()
        Return respuesta
    End Function

    Public Shared Function comprobarPreguntaSecreta(ByVal email As String, ByVal respuesta As String) As String
        Dim st As String
        'Mirar si email y respuesta concuerdan
        st = "SELECT count(*) from Usuarios WHERE email ='" & email & " ' AND respuesta='" & respuesta & " ' "
        comando = New SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    'hay que hacer algo asi?
    Public Shared Function obtenerCodAsig(ByVal email As String) As DataTable
        Dim daTareas As SqlDataAdapter
        Dim dsTareas As DataSet
        daTareas = New SqlDataAdapter("SELECT codigoasig FROM GruposClase INNER JOIN EstudiantesGrupo ON GruposClase.codigo = EstudiantesGrupo.grupo AND EstudiantesGrupo.email = '" & email & " ' ", conexion)
        dsTareas = New DataSet()
        daTareas.Fill(dsTareas, "CodAsig")
        Return dsTareas.Tables("CodAsig")
    End Function


    Public Shared Function obtenerTareasSinRealizarAlumno(ByVal codAsig As String, ByVal email As String, ByVal tabla1 As DataTable) As DataTable
        Dim daTareas As SqlDataAdapter
        Dim dsTareas As DataSet
        Dim st As String = "SELECT Codigo, Descripcion, HEstimadas, TipoTarea, CodAsig FROM TareasGenericas WHERE Explotacion = 1  AND Codigo NOT IN(SELECT CodTarea FROM EstudiantesTareas WHERE Email='" & email & "')"

        daTareas = New SqlDataAdapter(st, conexion)
        dsTareas = New DataSet()
        daTareas.Fill(dsTareas, "TareasGenericas")

        Return dsTareas.Tables("TareasGenericas")
    End Function

    'la funcion de los horrores, (por ahora no se utiliza) si da tiempo lo miramos
    Public Shared Function obtenerTareasRealizadasAlumno(ByVal email As String) As DataTable
        Dim st As String = "SELECT * FROM EstudiantesTareas WHERE (Email ='" & email & "')"

        ' MsgBox(st)
        daTareasInstanciar = New SqlDataAdapter(st, conexion)
        dsTareasInstanciar = New DataSet()
        daTareasInstanciar.Fill(dsTareasInstanciar, "EstudiantesTareas")

        Return dsTareasInstanciar.Tables("EstudiantesTareas")
    End Function


    Public Shared Function actualizarTablaTareas(ByVal usuario As String, ByVal tarea As String, ByVal horasEst As String, ByVal horasReales As String, ByVal email As String) As String
        Dim st As String = "SELECT * FROM EstudiantesTareas WHERE (Email ='" & email & "')"
        Dim daTareas As New SqlDataAdapter(st, conexion)
        Dim dtTareas As New DataTable
        Dim bldTareas As New SqlCommandBuilder(daTareas)
        Dim dsTareas As New DataSet

        Try
            daTareas.Fill(dsTareas, "EstudiantesTareas")
            dtTareas = dsTareas.Tables("EstudiantesTareas")

            Dim row As DataRow = dtTareas.NewRow
            row("Email") = usuario
            row("CodTarea") = tarea
            row("HEstimadas") = horasEst
            row("HReales") = horasReales
            dtTareas.Rows.Add(row)

            daTareas.Update(dsTareas, "EstudiantesTareas")
            dsTareas.AcceptChanges()
        Catch ex As Exception
            Return "Ha habido un error en la actualización de la BD: " & ex.Message
        End Try
        Return "La BD se ha actualizado correctamente"
    End Function


    Public Shared Function insertarTarea(ByVal Codigo As String, ByVal Descripcion As String, ByVal CodAsig As String,
                                            ByVal HEstimadas As Integer, ByVal TipoTarea As String) As String
        Dim st As String = "SELECT * FROM TareasGenericas WHERE (CodAsig ='" & CodAsig & "')"
        Dim daTarea As New SqlDataAdapter(st, conexion)
        Dim dtTarea As New DataTable
        Dim bldTarea As New SqlCommandBuilder(daTarea)
        Dim dsTarea As New DataSet
        ' Dim st = "insert into TareasGenericas (Codigo,Descripcion,CodAsig,HEstimadas,Explotacion,TipoTarea) values ('" & Codigo & " ','" & Descripcion & " ','" & CodAsig & " ','" & HEstimadas & " ',' 0','" & TipoTarea & " ')"

        Try
            daTarea.Fill(dsTarea, "TareasGenericas")
            dtTarea = dsTarea.Tables("TareasGenericas")

            Dim row As DataRow = dtTarea.NewRow
            row("Codigo") = Codigo
            row("Descripccion") = Descripcion
            row("CodAsig") = CodAsig
            row("HEstimadas") = HEstimadas
            row("Explotacion") = 0
            row("TipoTarea") = TipoTarea
            dtTarea.Rows.Add(row)

            daTarea.Update(dsTarea, "TareasGenericas")
            dsTarea.AcceptChanges()
        Catch ex As Exception
            Return "Ha habido un error al insertar la tarea: " & ex.Message
        End Try
        Return "La BD se ha actualizado correctamente"
    End Function

    Public Shared Function obtenerTareasGenericas() As DataTable
        daTareasGenericas.Fill(dsTareasGenericas, "TareasGenericas")
        Return dsTareasGenericas.Tables("TareasGenericas")
    End Function

    Public Shared Function llenarTareasGenericasDeXML(ByVal row As DataRow) As String
        Dim tabla As DataTable
        Try
            tabla = dsTareasGenericas.Tables("TareasGenericas")
            tabla.Rows.Add(row)
            daTareasGenericas.Update(dsTareasGenericas, "TareasGenericas")
            dsTareasGenericas.AcceptChanges()
        Catch ex As Exception
            Return "Ha habido un error en la BD: " & ex.Message
        End Try
        Return "Se ha actualizado la BD con archivo xml de forma correcta"
    End Function

    Public Shared Function obtenerTareasAsignatura(ByRef codasig As String) As DataTable
        Dim st As String = "SELECT * FROM TareasGenericas WHERE (CodAsig ='" & codasig & "')"
        Dim daTarea As New SqlDataAdapter(st, conexion)
        Dim bldTarea As New SqlCommandBuilder(daTarea)
        Dim dsTarea As New DataSet
        daTarea.Fill(dsTarea, "Tarea")
        Return dsTarea.Tables("Tarea")
    End Function

    Public Shared Function eliminarUsuario(ByRef email As String) As String
        conectar()
        Dim st = "DELETE FROM Usuarios WHERE (email ='" & email & "') "
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return (numregs & " usuario(s) eliminado(s) en la BD ")
    End Function
End Class