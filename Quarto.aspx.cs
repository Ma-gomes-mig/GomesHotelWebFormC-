using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CadastroHotel
{
    public partial class Quarto : System.Web.UI.Page
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

            if (TextBoxNumeroQuarto.Text.Length > 0 && TextBoxTipoQuarto.Text.Length > 0 && TextBoxPrecoDiaria.Text.Length > 0)
            {
                cmd.CommandText = "INSERT INTO Badroom (Numero_Quarto, TipoQuarto, Preco_Diaria, StatusQuarto) VALUES (@numero, @tipo, @preco, @status)";
                cmd.Parameters.AddWithValue("numero", TextBoxNumeroQuarto.Text);
                cmd.Parameters.AddWithValue("tipo", TextBoxTipoQuarto.Text);
                cmd.Parameters.AddWithValue("preco", TextBoxPrecoDiaria.Text);
                cmd.Parameters.AddWithValue("status", 0);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                //Atualizar o gridview para poder ver os dados
                GridView1.DataBind();

                TextBoxMsg.Text = "Quarto inserido com sucesso!";
            }
            else
            {
                TextBoxMsg.Text = "Não foi possivel inserir o Cliente por favor revise os dados. Caso o erro persista entre em contato com o administrador do sistema.";
            }
            TextBoxNumeroQuarto.Text = "";
            TextBoxTipoQuarto.Text = "";
            TextBoxPrecoDiaria.Text = "";
        }
    }
}