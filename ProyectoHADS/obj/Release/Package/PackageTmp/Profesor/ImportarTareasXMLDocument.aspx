<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasXMLDocument.aspx.vb" Inherits="ProyectoHADS.WebForm7" %>

<%@ Register src="../cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>

<%@ Register src="menuProfesor.ascx" tagname="menuProfesor" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body style="height: 585px">
    
    <form id="form1" runat="server">
    <div>
    
        <uc1:cabecera ID="cabecera1" runat="server" />
    
    </div>
    
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <uc2:menuProfesor ID="menuProfesor1" runat="server" />
     <div id="1" style="color: #000000; background-color: #C0C0C0; font-weight: bold; font-size: large; position: absolute; border: 2px inset #000000; top: 87px; left: 10px; height: 61px; width: 645px;">
        
        
        GESTIÓN DE TAREAS-DEDICACIÓN <br />
        <br />
        PROFESOR&nbsp;
         </div >
       
    <div style="height: 219px; width: 323px">
        <p style="width: 235px">
            Seleccionar asignatura a importar:&nbsp;&nbsp;&nbsp;
        </p>
        <asp:DropDownList ID="ddAsignatura" runat="server" AutoPostBack="True" DataSourceID="dsAsignaturas" DataTextField="codigoasig">
        </asp:DropDownList>
        <p>
            <asp:Button ID="btImportar" runat="server" Text="Importar (XMLD)" />
            <asp:SqlDataSource ID="dsAsignaturas" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <div style="position: relative; top: -153px; left: 338px; height: 242px; width: 340px">
        <p>
            &nbsp;</p>
            <p>
                &nbsp;</p>
            <p>
            Tabla:</p>
        <p>
            <asp:Label ID="lbMensaje" runat="server" Text="La asignatura no cuenta con un fichero XML propio" Visible="False"></asp:Label>
        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
            </p>
             </div>
        </div>
    </form>
  
   
</body>
</html>
