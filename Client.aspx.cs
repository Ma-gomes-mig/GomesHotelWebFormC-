using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CadastroHotel
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSalvar_Click(object sender, EventArgs e)
        {
            //Captura a string de conexão
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/App_Data");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            //Criar um objeto de conexão
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (TextBoxNome.Text.Length > 0 && TextBoxEmail.Text.Length > 0 && TextBoxSenha.Text.Length > 0 && TextBoxTelefone.Text.Length > 0)
            {
                cmd.CommandText = "INSERT INTO Client (Nome_Client, Email_Client, Telefone_Client, Senha_Client) VALUES (@nome, @email, @telefone, @senha)";
                cmd.Parameters.AddWithValue("nome", TextBoxNome.Text);
                cmd.Parameters.AddWithValue("email", TextBoxEmail.Text);
                cmd.Parameters.AddWithValue("telefone", TextBoxTelefone.Text);
                cmd.Parameters.AddWithValue("senha", TextBoxSenha.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //Atualizar o gridview para poder ver os dados
                GridView1.DataBind();
                TextBoxMensagem.Text = "Cliente inserido com sucesso!";
            }
            else
            {
                TextBoxMensagem.Text = "Não foi possivel inserir o Cliente por favor revise os dados. Caso o erro persista entre em contato com o administrador do sistema.";
            }
            TextBoxNome.Text = "";
            TextBoxEmail.Text = "";
            TextBoxSenha.Text = "";
            TextBoxTelefone.Text = "";
        }
    }
}