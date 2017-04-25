<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VerEstadisticas.aspx.vb" Inherits="ProyectoHADS.VerEstadisticas" %>

<%@ Register src="cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
    
    </div>
        <p>
            Selecciona un alumno:</p>
        <p>
            <asp:DropDownList ID="ddAlumno" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email">
            </asp:DropDownList>
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" InsertCommandType="StoredProcedure" SelectCommand="SELECT EstudiantesGrupo.Email FROM EstudiantesGrupo INNER JOIN ProfesoresGrupo ON EstudiantesGrupo.Grupo = ProfesoresGrupo.codigogrupo WHERE ProfesoresGrupo.email = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="Email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
            <series>
                <asp:Series Name="Series1" XValueMember="CodTarea" YValueMembers="HReales">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT [HReales], [CodTarea] FROM [EstudiantesTareas] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddAlumno" Name="Email" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
