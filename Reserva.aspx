<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="CadastroHotel.Reserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="LabelClient" runat="server" Text="Cliente" Font-Bold="True"></asp:Label><br />
        <asp:DropDownList ID="DropDownListClient" runat="server" DataSourceID="SqlDataSourceClienteReserva" DataTextField="Nome_Client" DataValueField="Id"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceClienteReserva" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Client] ([Nome_Client]) VALUES (@Nome_Client)" SelectCommand="SELECT [Id], [Nome_Client] FROM [Client]" UpdateCommand="UPDATE [Client] SET [Nome_Client] = @Nome_Client WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nome_Client" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome_Client" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div>
        <asp:Label ID="LabelQuarto" runat="server" Text="Quarto" Font-Bold="true"></asp:Label><br />
        
        <asp:GridView ID="GridViewQuarto" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSourceQuartoReserva">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Numero_Quarto" HeaderText="Numero" SortExpression="Numero_Quarto" />
                <asp:BoundField DataField="TipoQuarto" HeaderText="TipoQuarto" SortExpression="TipoQuarto" />
                <asp:BoundField DataField="Preco_Diaria" HeaderText="Preco" SortExpression="Preco_Diaria" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceQuartoReserva" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Numero_Quarto], [TipoQuarto], [Preco_Diaria] FROM [Badroom]">
        </asp:SqlDataSource>
    </div><br />

    <div><asp:Calendar ID="CalendarInicio" runat="server"></asp:Calendar><asp:Calendar ID="CalendarFinal" runat="server"></asp:Calendar><br />   
        <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" OnClick="ButtonSalvar_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSourceReservaDb">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ClientId" HeaderText="ClientId" SortExpression="ClientId" />
                <asp:BoundField DataField="BadroomId" HeaderText="BadroomId" SortExpression="BadroomId" />
                <asp:BoundField DataField="DataEntrada" HeaderText="DataEntrada" SortExpression="DataEntrada" />
                <asp:BoundField DataField="DataSaida" HeaderText="DataSaida" SortExpression="DataSaida" />
                <asp:BoundField DataField="ValorTotal" HeaderText="ValorTotal" SortExpression="ValorTotal" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceReservaDb" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Reservas] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reservas] ([ClientId], [BadroomId], [DataEntrada], [DataSaida], [ValorTotal]) VALUES (@ClientId, @BadroomId, @DataEntrada, @DataSaida, @ValorTotal)" SelectCommand="SELECT [Id], [ClientId], [BadroomId], [DataEntrada], [DataSaida], [ValorTotal] FROM [Reservas]" UpdateCommand="UPDATE [Reservas] SET [ClientId] = @ClientId, [BadroomId] = @BadroomId, [DataEntrada] = @DataEntrada, [DataSaida] = @DataSaida, [ValorTotal] = @ValorTotal WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClientId" Type="Int32" />
                <asp:Parameter Name="BadroomId" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DataEntrada" />
                <asp:Parameter DbType="Date" Name="DataSaida" />
                <asp:Parameter Name="ValorTotal" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClientId" Type="Int32" />
                <asp:Parameter Name="BadroomId" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DataEntrada" />
                <asp:Parameter DbType="Date" Name="DataSaida" />
                <asp:Parameter Name="ValorTotal" Type="Decimal" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
</asp:Content>
