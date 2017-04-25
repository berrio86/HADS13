<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="ProyectoHADS.TareasAlumno" %>

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
  
    
        <uc1:cabecera ID="cabecera1" runat="server" />
       <h3 >ALUMNOS</h3>
<h3 >GESTION DE TAREAS GENERICAS</h3>
        <uc2:menuAlumno ID="menuAlumno1" runat="server" />
        <p >
            <asp:DropDownList ID="ddAsignaturas" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </p>
        <br />
        <asp:GridView ID="gvTareas" runat="server" DataKeyNames="Codigo" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnablePersistedSelection="True" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Left" AllowSorting="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Instanciar" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="lblRespuesta" runat="server"></asp:Label>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
