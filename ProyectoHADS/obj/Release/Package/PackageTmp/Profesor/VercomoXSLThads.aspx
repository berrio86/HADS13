<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VercomoXSLThads.aspx.vb" Inherits="ProyectoHADS.VercomoXSLT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Xml ID="xmlHads1" runat="server" DocumentSource="../App_Data/HAS.xml" TransformSource="../App_Data/Hads.xslt"></asp:Xml>
        <p>
            <asp:LinkButton ID="lbCodigo" runat="server">Ordenar por codigo</asp:LinkButton>
        </p>
        <asp:LinkButton ID="lbDes" runat="server">Ordenar por descripcion</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="lbHE" runat="server">Ordenar por Horas estimadas</asp:LinkButton>
    </form>
</body>
</html>
