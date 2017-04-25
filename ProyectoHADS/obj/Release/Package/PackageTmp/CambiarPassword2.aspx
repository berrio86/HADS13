<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword2.aspx.vb" Inherits="ProyectoHADS.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Label1">
    
        Hola
        <asp:Label ID="lblEmail" runat="server"></asp:Label>
        :<br />
        <br />
        <br />
    
        Pregunta secreta:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPreguntaSecreta" runat="server"></asp:Label>
        <br />
        <br />
        Respuesta&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="respuesta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="respuesta" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="ButtonComprobar" runat="server" Text="Comprobar" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Inicio.aspx">Volver al inicio</asp:HyperLink>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Nueva contraseña" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Pass1" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
        &nbsp;
        &nbsp;<asp:RequiredFieldValidator ID="valReq1" runat="server" ControlToValidate="Pass1" Enabled="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valCar1" runat="server" ControlToValidate="Pass1" ErrorMessage="La contraseña tiene que tener mínimo 6 caracteres" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$" Enabled="False"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text=" Repite contraseña" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="Pass2" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
        &nbsp;
        &nbsp;
        <asp:RequiredFieldValidator ID="valReq2" runat="server" ControlToValidate="Pass2" ErrorMessage=" * " ForeColor="#FF3300" Enabled="False"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="valEq1" runat="server" ControlToCompare="Pass1" ControlToValidate="Pass2" ErrorMessage="Las dos contraseñas deben ser iguales" ForeColor="Red" Enabled="False"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="ButtonCambiar" runat="server" Text="Cambiar" Visible="False" />
        <br />
        <br />
        <asp:Label ID="lblRespuesta" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
