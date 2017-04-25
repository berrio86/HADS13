<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="ProyectoHADS.Profesor" %>

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
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR
         </div >
        <br />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="lbTareaProfesor" runat="server">Tareas Profesor</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image2" runat="server" Height="24px" ImageUrl="~/iconos/user-shape.png" Width="24px" />
        <br />
        <asp:LinkButton ID="hvInsertTar" runat="server">Insertar Tarea</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" ImageUrl="~/iconos/back-arrow.png" Width="24px" />
        <br />
        <asp:LinkButton ID="lbEstadis" runat="server">Ver estadisticas</asp:LinkButton>
        
        &nbsp;&nbsp; &nbsp;
        <asp:Image ID="Image1" runat="server" ImageUrl="~/iconos/poll-symbol-on-black-square-with-rounded-corners.png" Width="24px" />

        </form>
