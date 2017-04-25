<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="ProyectoHADS.InstanciarTarea" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

<%@ Register src="menuAlumno.ascx" tagname="menuAlumno" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString2 %>" SelectCommand="SELECT * FROM [EstudiantesTareas] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <uc1:cabecera ID="cabecera1" runat="server" />
    
    </div>
       
        <uc2:menuAlumno ID="menuAlumno1" runat="server" />
        <p>
            &nbsp;</p>
        <p>
            Usuario:
            <asp:TextBox ID="tbUsuario" runat="server" ReadOnly="True" Width="165px" BackColor="#CCCCCC"></asp:TextBox>
        </p>
        <p>
            Tarea:
            <asp:TextBox ID="tbTarea" runat="server" ReadOnly="True" Width="175px" BackColor="#CCCCCC"></asp:TextBox>
        </p>
        <p>
            Horas Est: <asp:TextBox ID="tbHorasEst" runat="server" ReadOnly="True" Width="149px" BackColor="#CCCCCC"></asp:TextBox>
        </p>
        <p>
            Horas Reales:
            <asp:TextBox ID="tbHorasReales" runat="server" Width="128px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbHorasReales" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnCrearTarea" runat="server" Height="56px" Text="Crear Tarea" Width="189px" />
        </p>
        <p>
            <asp:Label ID="lblRespuesta" runat="server"></asp:Label>
        </p>
        <p>
            <asp:LinkButton ID="lbAnterior" runat="server">Página anterior</asp:LinkButton>
        </p>
        <p>
            <asp:GridView ID="gvTareasRealizadas" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Email,CodTarea" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Email" DataField="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField HeaderText="CodTarea" DataField="CodTarea" ReadOnly="True" SortExpression="CodTarea" />
                    <asp:BoundField HeaderText="HEstimadas" DataField="HEstimadas" SortExpression="HEstimadas" />
                    <asp:BoundField HeaderText="HReales" DataField="HReales" SortExpression="HReales" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
