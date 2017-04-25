<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="menuAlumno.ascx.vb" Inherits="ProyectoHADS.menuAlumno" %>
<style type="text/css">
    .auto-style1 {
        text-align: center;
    }
</style>
<p class="auto-style1">
    <strong>
        <asp:LinkButton ID="lbTareas" runat="server">Tareas Genericas</asp:LinkButton>
&nbsp;<asp:Image ID="Image4" runat="server" ImageUrl="~/iconos/label-right-arrow-outline.png" Width="24px" />
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbInsertar" runat="server">Tareas propias</asp:LinkButton>
&nbsp;
        <asp:Image ID="Image2" runat="server" Height="24px" ImageUrl="~/iconos/add-label-button.png" Width="24px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbEstadis" runat="server">Grupos</asp:LinkButton>
&nbsp;
        <asp:Image ID="Image3" runat="server" Height="24px" ImageUrl="~/iconos/users-social-symbol.png" Width="24px" />
&nbsp; </strong></p>

