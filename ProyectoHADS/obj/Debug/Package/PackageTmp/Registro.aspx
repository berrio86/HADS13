<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="ProyectoHADS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Email<br />
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Inserte un correo válido." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        Nombre<br />
        <asp:TextBox ID="nombre" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nombre" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="nombre" ErrorMessage="Inserte un nombre válido (Primera letra mayúscula)" ForeColor="Red" ValidationExpression="[A-Z]{1}[a-z ]{1,}"></asp:RegularExpressionValidator>
        <br />
        <br />
        Primer apellido<br />
        <asp:TextBox ID="apellido1" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="apellido1" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="apellido1" ErrorMessage="Inserte un apellido válido (Primera letra mayúscula)" ForeColor="Red" ValidationExpression="[A-Z]{1}[a-z ]{1,}"></asp:RegularExpressionValidator>
        <br />
        <br />
        Segundo apellido<br />
        <asp:TextBox ID="apellido2" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="apellido2" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="apellido2" ErrorMessage="Inserte un apellido válido (Primera letra mayúscula)" ForeColor="Red" ValidationExpression="[A-Z]{1}[a-z ]{1,}"></asp:RegularExpressionValidator>
        <br />
        <br />
        DNI<br />
        <asp:TextBox ID="dni" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dni" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="dni" ErrorMessage="Inserte un DNI válido (8 digitos y una letra)" ForeColor="Red" ValidationExpression="^(\d{8}([A-Z]|[a-z]))$"></asp:RegularExpressionValidator>
        <br />
        <br />
        Contraseña<br />
        <asp:TextBox ID="password1" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password1" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="password1" ErrorMessage="La contraseña tiene que tener mínimo 6 caracteres" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        Repetir contraseña<br />
        <asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="password2" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password1" ControlToValidate="password2" ErrorMessage="Las dos contraseñas deben ser iguales" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        Pregunta secreta<br />
        <asp:DropDownList ID="pregunta" runat="server" Height="92px" Width="250px">
            <asp:ListItem>Como se llamaba  tu primera  mascota</asp:ListItem>
            <asp:ListItem>Tu primer correo electronico</asp:ListItem>
            <asp:ListItem>Segundo apellido de tu padre</asp:ListItem>
            <asp:ListItem>Nombre de tu comida favorita</asp:ListItem>
            <asp:ListItem>Cual es tu ciudad de nacimiento</asp:ListItem>
            <asp:ListItem>Numero de DNI</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Respuesta<br />
        <asp:TextBox ID="respuesta" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="respuesta" ErrorMessage=" * " ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#FFCC99" BorderColor="Red" ForeColor="Red" />
        <br />
        <br />
        <asp:Button ID="enviar" runat="server" Text="Enviar" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Inicio.aspx">Volver al inicio</asp:HyperLink>
        <br />
        <br />
        <asp:Label ID="resultadoDB" runat="server"></asp:Label>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
