<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="ProyectoHADS.Profesor" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc2" %>

<%@ Register src="../footer.ascx" tagname="footer" tagprefix="uc3" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    
    
        <uc1:cabecera ID="cabecera1" runat="server" />
        <br />
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
      
        <br />
        <br />
        <br />
        <uc2:menuProfesor ID="menuProfesor1" runat="server" />
      
        <br />
        
        <asp:Button ID="btnAlumnos" runat="server" Text="Ir a la sección de Alumnos" Width="324px" />
        <div id="admin">

            <asp:Button ID="btnAdmin" runat="server" Text="Volver a la sección de administrador" Visible="False" Width="325px" />

            <br />

        </div>
        
        <uc3:footer ID="footer1" runat="server" />
        
        </form>
    </body>
    </html>