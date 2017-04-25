<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Administrador.aspx.vb" Inherits="ProyectoHADS.Administrador" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

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
    
        <asp:Button ID="btnProfesores" runat="server" Text="Ir a sección de profesores" />
        <br />
        <asp:Button ID="btnAlumnos" runat="server" Text="Ir a sección de alumnos" Width="225px" />
        <br />
        <br />
        ADMINISTRADOR DE USUARIOS<br />
        <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="sqldsUsuarios">
            <Columns>
                <asp:CommandField SelectText="Eliminar usuario" ShowSelectButton="True" />
                <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="dni" HeaderText="dni" SortExpression="dni" />
                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
            </Columns>
        </asp:GridView>
        <br />
    
    </div>
        <asp:SqlDataSource ID="sqldsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [email] = @email" InsertCommand="INSERT INTO [Usuarios] ([email], [nombre], [apellidos], [dni], [grupo]) VALUES (@email, @nombre, @apellidos, @dni, @grupo)" SelectCommand="SELECT [email], [nombre], [apellidos], [dni], [grupo] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [nombre] = @nombre, [apellidos] = @apellidos, [dni] = @dni, [grupo] = @grupo WHERE [email] = @email">
            <DeleteParameters>
                <asp:Parameter Name="email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="dni" Type="String" />
                <asp:Parameter Name="grupo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="dni" Type="String" />
                <asp:Parameter Name="grupo" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblConfirmacion" runat="server" ForeColor="Red" Text="¿Realmente quieres eliminar este usuario?" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnSI" runat="server" Text="Si" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNo" runat="server" Text="No" Visible="False" />
        <br />
        <asp:Label ID="lbMensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
