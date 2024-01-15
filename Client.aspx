<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="CadastroHotel.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Cadastre-se Aqui</h1>
    <asp:Label ID="LabelNome" runat="server" Text="Nome:" Font-Bold="True"></asp:Label> <br />
    <asp:TextBox ID="TextBoxNome" runat="server"></asp:TextBox> <br />
    <asp:Label ID="LabelEmail" runat="server" Text="Email:" Font-Bold="True"></asp:Label><br />
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox><br />
    <asp:Label ID="LabelSenha" runat="server" Text="Senha:" Font-Bold="True"></asp:Label><br />
    <asp:TextBox ID="TextBoxSenha" runat="server"></asp:TextBox><br />
    <asp:Label ID="LabelTelefone" runat="server" Text="Telefone:" Font-Bold="True"></asp:Label><br />
    <asp:TextBox ID="TextBoxTelefone" runat="server"></asp:TextBox><br />
    <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" OnClick="ButtonSalvar_Click" />
    <br /><br />
    <asp:TextBox ID="TextBoxMensagem" runat="server" Width="802px"></asp:TextBox>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceClient">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nome_Client" HeaderText="Nome" SortExpression="Nome_Client" />
            <asp:BoundField DataField="Email_Client" HeaderText="Email" SortExpression="Email_Client" />
            <asp:BoundField DataField="Telefone_Client" HeaderText="Telefone" SortExpression="Telefone_Client" />
            <asp:BoundField DataField="Senha_Client" HeaderText="Senha" SortExpression="Senha_Client" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceClient" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Client] ([Nome_Client], [Email_Client], [Telefone_Client], [Senha_Client]) VALUES (@Nome_Client, @Email_Client, @Telefone_Client, @Senha_Client)" SelectCommand="SELECT [Id], [Nome_Client], [Email_Client], [Telefone_Client], [Senha_Client] FROM [Client]" UpdateCommand="UPDATE [Client] SET [Nome_Client] = @Nome_Client, [Email_Client] = @Email_Client, [Telefone_Client] = @Telefone_Client, [Senha_Client] = @Senha_Client WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nome_Client" Type="String" />
            <asp:Parameter Name="Email_Client" Type="String" />
            <asp:Parameter Name="Telefone_Client" Type="String" />
            <asp:Parameter Name="Senha_Client" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome_Client" Type="String" />
            <asp:Parameter Name="Email_Client" Type="String" />
            <asp:Parameter Name="Telefone_Client" Type="String" />
            <asp:Parameter Name="Senha_Client" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
