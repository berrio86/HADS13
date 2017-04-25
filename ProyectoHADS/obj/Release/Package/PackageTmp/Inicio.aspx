<%@ Page Language="vb" AutoEventWireup="false"   CodeBehind="Inicio.aspx.vb" Inherits="ProyectoHADS.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    
    <style type="text/css">
        .login-button {
            width: 53px;
        }
    </style>
    
</head>
<body>
    
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css' />
    
            <h1>Login</h1>
    <p>&nbsp;</p>
        
        <form id="form1" runat="server">
        

        <h3>Email <asp:Image ID="Image1" runat="server" ImageUrl="~/iconos/black-envelope-email-symbol.png" Width="24px" />
            </h3>
        <asp:TextBox ID="email" CssClass="sarrera" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Inserte un correo válido." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
        <h3>Contraseña
            <asp:Image ID="Image2" runat="server" ImageUrl="~/iconos/password.png" />
            </h3>
        <asp:TextBox ID="password" CssClass="sarrera" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="password" ErrorMessage="La contraseña tiene que tener mínimo 6 caracteres" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
        
            <br />
            <br />
        
        <asp:Button ID="Button1" CssClass="login-button" runat="server" Text="Enviar" />
        
            <br />
            <br />
        
        <asp:HyperLink ID="HyperLink2"  CssClass="sign-up" runat ="server" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink><br/>
        
        <asp:HyperLink ID="HyperLink1" CssClass="no-access"  runat="server" NavigateUrl="~/CambiarPassword.aspx">Cambiar contraseña</asp:HyperLink><br/>
        
        <asp:Label ID="lblRespuesta" runat="server" ForeColor="Red"></asp:Label>
       
        </form>
    
    
</body>
</html>
