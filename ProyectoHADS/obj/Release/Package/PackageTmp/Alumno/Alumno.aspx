<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="ProyectoHADS.WebForm5"  %>
<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>
<%@ Register src="menuAlumno.ascx" tagname="menuAlumno" tagprefix="uc2" %>
<%@ Register src="../footer.ascx" tagname="footer" tagprefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
     
    <div>
        <uc1:cabecera ID="cabecera1" runat="server" />
        <br />
        <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 1px inset #000000; top: 82px; left: 10px; height: 64px; width: 646px;">
            
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
   
        ALUMNOS<br />
&nbsp;<br />
            </div>

        <br />
        <br />
       
        <br />
        <uc2:menuAlumno ID="menuAlumno1" runat="server" />
        <br />

        <div id="profesor">


            <asp:Button ID="btnProfesor" runat="server" Text="Volver a la sección de profesores" Visible="False" />


        </div>
        <div id="administrador">

            <asp:Button ID="btnAdmin" runat="server" Text="Volver a la sección de administrador" Visible="False" Width="287px" />
            <br />
            <br />

        </div>
        <br />
        <br />
        <br />
    
    </div>
        <uc3:footer ID="footer1" runat="server" />
    </form>
</body>
</html>
