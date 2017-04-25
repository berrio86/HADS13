<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="menuProfesor.ascx.vb" Inherits="ProyectoHADS.menuProfesor" %>
<style type="text/css">

        .auto-style1 {
            text-align: center;
        }
    </style>
<div style="height: 50px; width: 732px">
    <h3 class="auto-style1">
        <asp:LinkButton ID="lbTareas" runat="server">Tareas Profesor</asp:LinkButton>
&nbsp;
        <asp:Image ID="Image2" runat="server" Height="24px" ImageUrl="~/iconos/user-shape.png" Width="24px" />
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbInsertar" runat="server">Insertar Tarea</asp:LinkButton>
&nbsp;
        <asp:Image ID="Image3" runat="server" ImageUrl="~/iconos/back-arrow.png" Width="24px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbEstadis" runat="server">Ver estadisticas</asp:LinkButton>
&nbsp;
        <asp:Image ID="Image1" runat="server" ImageUrl="~/iconos/poll-symbol-on-black-square-with-rounded-corners.png" Width="24px" />
&nbsp; </h3>
    <h3 class="auto-style1">&nbsp;<asp:LinkButton ID="lbImportXML" runat="server">Importar v.XML</asp:LinkButton>
&nbsp;
        <asp:Image ID="imgImpor" runat="server" ImageUrl="~/iconos/download-button.png" Width="24px" />
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbExportar" runat="server">Exportar </asp:LinkButton>
&nbsp;
        <asp:Image ID="imgExportar" runat="server" ImageUrl="~/iconos/upload-button.png" Width="24px" />
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server">Importar v.DataSet</asp:LinkButton>
&nbsp;
        <asp:Image ID="imgImport2" runat="server" ImageUrl="~/iconos/download-button-1.png" Width="24px" />
    </h3>
    <p class="auto-style1">
        <asp:LinkButton ID="lbXSLT" runat="server" style="font-weight: 700">VER XSLT</asp:LinkButton>
    </p>
    <p class="auto-style1">&nbsp;</p>
</div>
<p>
    &nbsp;</p>

