<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coordinador.aspx.vb" Inherits="ProyectoHADS.coordinador" %>

<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc1" %>
<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:cabecera ID="cabecera1" runat="server" />
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 90px; left: 14px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
      
        <br />
        <br />
        <br />
        <uc1:menuProfesor ID="menuProfesor1" runat="server" />
        <p>
            &nbsp;</p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="ddAsig" runat="server" AutoPostBack="True" DataSourceID="sqldsAsig" DataTextField="codigoasig">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqldsAsig" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="Email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <p>
                    La dedicacion media a la asignatura es :
                    <asp:Label ID="lbMedia" runat="server"></asp:Label>
                </p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            &nbsp;</p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
