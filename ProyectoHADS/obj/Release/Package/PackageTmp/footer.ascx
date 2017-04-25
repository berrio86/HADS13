<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="footer.ascx.vb" Inherits="ProyectoHADS.footer" %>
<p>
    &nbsp;<p>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</p>
<p>
    &nbsp;</p>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="5000">
                </asp:Timer>
                <div id="right" style="height: 182px; width: 394px; margin-top: 17px">
                    Alumnos conectados:
                    <br />
                    &nbsp;<asp:ListBox ID="lbAlumnos" runat="server" Width="131px"></asp:ListBox>
                    <br />
                    Profesores conectados:&nbsp;
                    <br />
                    <asp:ListBox ID="lbProfesores" runat="server" Width="131px"></asp:ListBox>
                </div>
                <br />
                <div id="left" style="width: 468px; height: 41px">
                El último usuario conectado es:
                <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                <br />
                Los usuarios conectados son
                <asp:Label ID="lbCount" runat="server"></asp:Label>
                <br />
                    <br />
                    <br />
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </ContentTemplate>
</asp:UpdatePanel>




