<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="ProyectoHADS.WebForm5"  %>
<%@ Register src="cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>
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
            <br />
            <br /> <br />
             
             
        <br />
            </p>
            </div>
        <br />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="lbTareaGenerica" runat="server">Tareas Genéricas</asp:LinkButton>
        &nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" ImageUrl="~/iconos/label-right-arrow-outline.png" Width="24px" />
        <br />
        <asp:LinkButton ID="lbTareaPropia" runat="server">Tareas Propias</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image2" runat="server" Height="24px" ImageUrl="~/iconos/add-label-button.png" Width="24px" />
        <br />
        <asp:LinkButton ID="lbGrupo" runat="server">Grupos</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" Height="24px" ImageUrl="~/iconos/users-social-symbol.png" Width="24px" />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
