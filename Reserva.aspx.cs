using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CadastroHotel
{
    public partial class Reserva : System.Web.UI.Page
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



            if (DropDownListClient.SelectedValue.Length > 0 && GridViewQuarto.Rows != null && CalendarInicio.ToString() != "" && CalendarFinal.ToString() != "")
            {
                cmd.CommandText = 
                    "INSERT INTO Reservas (ClientId, BadroomId, DataEntrada, DataSaida, ValorTotal) VALUES (@clienteId, @badroomId, @dataEntrada, @dataSaida, @valorTotal)";
                cmd.Parameters.AddWithValue("clienteId", DropDownListClient.SelectedValue);
                cmd.Parameters.AddWithValue("badroomId", GridViewQuarto.SelectedValue);
                cmd.Parameters.AddWithValue("dataEntrada", CalendarInicio.SelectedDate);
                cmd.Parameters.AddWithValue("dataSaida", CalendarFinal.SelectedDate);
                cmd.Parameters.AddWithValue("valorTotal", 0);
                //Object valorTotal = new Object();
                //var date = CalendarInicio.SelectedDate - CalendarFinal.SelectedDate;
                //valorTotal = TextBoxPrecoDiaria.

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                //Atualizar o gridview para poder ver os dados
                //GridView1.DataBind();

                //TextBoxMsg.Text = "Quarto inserido com sucesso!";
            }
            else
            {
                //TextBoxMsg.Text = "Não foi possivel inserir o Cliente por favor revise os dados. Caso o erro persista entre em contato com o administrador do sistema.";
            }
            //TextBoxNumeroQuarto.Text = "";
            //TextBoxTipoQuarto.Text = "";
            //TextBoxPrecoDiaria.Text = "";
        }
    }
    
}