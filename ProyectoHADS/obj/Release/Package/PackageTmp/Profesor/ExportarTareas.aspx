<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarTareas.aspx.vb" Inherits="ProyectoHADS.ExportarTareas" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 418px">
    <form id="form1" runat="server">
    <div>
    
        <uc1:cabecera ID="cabecera1" runat="server" />
    </div>
   
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
        <p>
            &nbsp;</p>
         <div style="height: 166px; width: 317px">
        <p>
            &nbsp;</p>
             <uc2:menuProfesor ID="menuProfesor1" runat="server" />
             <p>
            Seleccionar asignatura a exportar:</p>
        <p>
            <asp:DropDownList ID="ddAsigna" runat="server" DataSourceID="dsAsignaturas" DataTextField="codigoasig" AutoPostBack="True">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="btXML" runat="server" Text="Exportar XML" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btJSON" runat="server" Text="Exportar JSON" />
        </p>
             <p>
                 <asp:Label ID="lblMensje" runat="server"></asp:Label>
        </p>
             </div>
        <div style="height: 182px; width: 347px; position: relative; top: -8px; left: 407px">
           Tabla:
        <asp:GridView ID="gvAsig" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="gvProfesor">
                <Columns>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                    <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                    <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                    <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                </Columns>
            </asp:GridView>
            <br />
        <asp:SqlDataSource ID="gvProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT * FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TareasGenericas] ([Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea]) VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @Codigo">
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
                <asp:ControlParameter ControlID="ddAsigna" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
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
        </div>
        <p>
            &nbsp;</p>
              
        <p>
            &nbsp;</p>
        <asp:SqlDataSource ID="dsAsignaturas" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="Email" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
