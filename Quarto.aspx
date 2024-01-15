<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Quarto.aspx.cs" Inherits="CadastroHotel.Quarto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Cadastre aqui os quartos</h2><br />

    <asp:Label ID="LabelNumeroQuarto" runat="server" Text="Numero do Quarto" Font-Bold="True"></asp:Label><br />
    <asp:TextBox ID="TextBoxNumeroQuarto" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LabelTipoQuarto" runat="server" Text="Tipo do Quarto" Font-Bold="true"></asp:Label><br />
    <asp:TextBox ID="TextBoxTipoQuarto" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LabelPrecoDiaria" runat="server" Text="Preço da Diaria" Font-Bold="true"></asp:Label><br />
    <asp:TextBox ID="TextBoxPrecoDiaria" runat="server"></asp:TextBox>
    <br />
    <br />
    
    <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" OnClick="ButtonSalvar_Click" /><br /><br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSourceQuarto" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Numero_Quarto" HeaderText="Numero" SortExpression="Numero_Quarto" />
            <asp:BoundField DataField="TipoQuarto" HeaderText="Tipo" SortExpression="TipoQuarto" />
            <asp:BoundField DataField="Preco_Diaria" HeaderText="Preco" SortExpression="Preco_Diaria" />
            <asp:CheckBoxField DataField="StatusQuarto" HeaderText="Status" SortExpression="StatusQuarto" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceQuarto" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Badroom] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Badroom] ([Numero_Quarto], [TipoQuarto], [Preco_Diaria], [StatusQuarto]) VALUES (@Numero_Quarto, @TipoQuarto, @Preco_Diaria, @StatusQuarto)" SelectCommand="SELECT [Id], [Numero_Quarto], [TipoQuarto], [Preco_Diaria], [StatusQuarto] FROM [Badroom]" UpdateCommand="UPDATE [Badroom] SET [Numero_Quarto] = @Numero_Quarto, [TipoQuarto] = @TipoQuarto, [Preco_Diaria] = @Preco_Diaria, [StatusQuarto] = @StatusQuarto WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Numero_Quarto" Type="Int32" />
            <asp:Parameter Name="TipoQuarto" Type="String" />
            <asp:Parameter Name="Preco_Diaria" Type="Decimal" />
            <asp:Parameter Name="StatusQuarto" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Numero_Quarto" Type="Int32" />
            <asp:Parameter Name="TipoQuarto" Type="String" />
            <asp:Parameter Name="Preco_Diaria" Type="Decimal" />
            <asp:Parameter Name="StatusQuarto" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource><br />

    <asp:TextBox ID="TextBoxMsg" runat="server" Width="780px"></asp:TextBox>
</asp:Content>
