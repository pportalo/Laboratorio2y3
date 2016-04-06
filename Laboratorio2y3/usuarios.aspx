<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="usuarios.aspx.vb" Inherits="Laboratorio2y3.usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="correo" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="correo" HeaderText="correo" ReadOnly="True" SortExpression="correo" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabConnectionString1 %>" DeleteCommand="DELETE FROM [usuarios] WHERE [correo] = @correo" InsertCommand="INSERT INTO [usuarios] ([correo], [password], [nombre], [apellidos], [DNI], [ref_pregunta], [respuesta], [clave]) VALUES (@correo, @password, @nombre, @apellidos, @DNI, @ref_pregunta, @respuesta, @clave)" ProviderName="<%$ ConnectionStrings:LabConnectionString1.ProviderName %>" SelectCommand="SELECT [correo], [password], [nombre], [apellidos], [DNI], [ref_pregunta], [respuesta], [clave] FROM [usuarios]" UpdateCommand="UPDATE [usuarios] SET [password] = @password, [nombre] = @nombre, [apellidos] = @apellidos, [DNI] = @DNI, [ref_pregunta] = @ref_pregunta, [respuesta] = @respuesta, [clave] = @clave WHERE [correo] = @correo">
            <DeleteParameters>
                <asp:Parameter Name="correo" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="DNI" Type="String" />
                <asp:Parameter Name="ref_pregunta" Type="Int32" />
                <asp:Parameter Name="respuesta" Type="String" />
                <asp:Parameter Name="clave" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="DNI" Type="String" />
                <asp:Parameter Name="ref_pregunta" Type="Int32" />
                <asp:Parameter Name="respuesta" Type="String" />
                <asp:Parameter Name="clave" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar sesion" Width="169px" />
    </form>
</body>
</html>

