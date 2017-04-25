<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="ProyectoHADS.InsertarTarea" %>

<%@ Register src="cabecera.ascx" tagname="cabecera" tagprefix="uc1" %>


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
        <h3>
    <asp:LinkButton ID="lbTareas" runat="server">Tareas Profesor</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lbInsertar" runat="server">Insertar Tarea</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbEstadis" runat="server">Ver estadisticas</asp:LinkButton>
        </h3>
        <h3>PROFESOR</h3> 
<h3 >GESTION DE TAREAS GENERICAS</h3>
        <p >Codigo&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbCod" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reCod" runat="server" ControlToValidate="tbCod" ErrorMessage="*   Rellena este campo correctamente por favor" ForeColor="Red" ValidationExpression="^[\s\S]{2,}$"></asp:RegularExpressionValidator>
        </p>
        <p >Descripcción</p>
        <p >
            <asp:TextBox ID="tbDesc" runat="server" Height="44px" Width="417px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reDesc" runat="server" ControlToValidate="tbDesc" ErrorMessage="*   Rellena este campo correctamente por favor" ForeColor="Red" ValidationExpression="^[\s\S]{2,}$"></asp:RegularExpressionValidator>
        </p>
        <p >&nbsp;Asignatura&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddAsig" runat="server" AutoPostBack="True" DataSourceID="dsAsig" DataTextField="codigoasig">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsAsig" runat="server" ConnectionString="<%$ ConnectionStrings:hads13dbConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p >Horas estimadas&nbsp;&nbsp;&nbsp; <asp:TextBox ID="tbHoras" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reHoras" runat="server" ControlToValidate="tbHoras" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]+">*     Horas incorrectas (Entre 0 y 9)</asp:RegularExpressionValidator>
        </p>
        <p >Tipo&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddTipo" runat="server">
                <asp:ListItem>Laboratorio</asp:ListItem>
                <asp:ListItem>Examen</asp:ListItem>
                <asp:ListItem>Trabajo</asp:ListItem>
                <asp:ListItem>Ejercicio</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p >
            <asp:Button ID="btAdd" runat="server" Text="Añadir" />
        </p>
        <p >
            <asp:Label ID="lbDBOK" runat="server"></asp:Label>
        </p>
    
    </div>
    </form>
</body>
</html>
