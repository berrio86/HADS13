<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="ProyectoHADS.WebForm6" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
        <br />
        <br />
        <uc2:menuProfesor ID="menuProfesor1" runat="server" />
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
      
        <br />
        <br />
        <p >
            <asp:Button ID="btInsert" runat="server" Height="41px" Text="Insertar tarea" Width="221px" />
        </p>
        <p >
            &nbsp;</p>
        <p >
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="gvProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TareasGenericas] ([Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea]) VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)" SelectCommand="SELECT * FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @Codigo">
                    <DeleteParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="CodAsig" Type="String" />
                        <asp:Parameter Name="HEstimadas" Type="Int32" />
                        <asp:Parameter Name="Explotacion" Type="Boolean" />
                        <asp:Parameter Name="TipoTarea" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddProfesor" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="CodAsig" Type="String" />
                        <asp:Parameter Name="HEstimadas" Type="Int32" />
                        <asp:Parameter Name="Explotacion" Type="Boolean" />
                        <asp:Parameter Name="TipoTarea" Type="String" />
                        <asp:Parameter Name="Codigo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="tareasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="Email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="gvtabla" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TareasGenericas] ([Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea]) VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)" SelectCommand="SELECT * FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @Codigo">
                    <DeleteParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="CodAsig" Type="String" />
                        <asp:Parameter Name="HEstimadas" Type="Int32" />
                        <asp:Parameter Name="Explotacion" Type="Boolean" />
                        <asp:Parameter Name="TipoTarea" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddProfesor" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="CodAsig" Type="String" />
                        <asp:Parameter Name="HEstimadas" Type="Int32" />
                        <asp:Parameter Name="Explotacion" Type="Boolean" />
                        <asp:Parameter Name="TipoTarea" Type="String" />
                        <asp:Parameter Name="Codigo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="ddProfesor" runat="server" AutoPostBack="True" DataSourceID="tareasProfesor" DataTextField="codigoasig">
                </asp:DropDownList>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Codigo" DataSourceID="gvtabla" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                        <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                        <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                        <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
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
                <ajaxToolkit:DragPanelExtender ID="GridView1_DragPanelExtender" runat="server" TargetControlID="GridView1" />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p >
            &nbsp;</p>
    
    </div>
    </form>
</body>
</html>
