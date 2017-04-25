<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasDataset.aspx.vb" Inherits="ProyectoHADS.ImportarTareasDataset" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>
<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 535px">
    <form id="form1" runat="server">
    <div>
    
        <uc1:cabecera ID="cabecera1" runat="server" />
        <br />
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
      
        <br />
        <br />
    
    </div>
        <uc2:menuProfesor ID="menuProfesor1" runat="server" />
       <div style="height: 128px; width: 273px">
            Seleccionar asignatura a importar:<br />
        <asp:DropDownList ID="ddAsig" runat="server" DataSourceID="dsAsignaturas" DataTextField="codigoasig" AutoPostBack="True">
        </asp:DropDownList>
        <br />
            <asp:SqlDataSource ID="dsAsignaturas" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:Button ID="btImport" runat="server" Text="Importar (DS)" style="height: 26px" />
            <br />
            <br />
            <br />
           </div>
    <div style="height: 198px; width: 452px; position: relative; top: -109px; left: 277px">
    <p>
        Tabla:<asp:Xml ID="Xml1" runat="server"></asp:Xml>
        </p>
        <p>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </div>
    </form>
    </body>
</html>
