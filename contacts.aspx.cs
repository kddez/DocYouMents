using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ProjetoFinal
{
    public partial class contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //capturar a string de conexão
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
            //cria um objeto de conexão
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            // Faz a inserção no Banco de dado
            cmd.CommandText = "Insert into contatos (email,nome,celular,assunto,mensagem) values (@email,@nome,@celular,@assunto,@mensagem)";
            cmd.Parameters.AddWithValue("@celular", cellcontact.Text);
            cmd.Parameters.AddWithValue("@email", emailcontact.Text);
            cmd.Parameters.AddWithValue("@assunto", subcontact.Text);
            cmd.Parameters.AddWithValue("@mensagem", messagecontact.Text);
            cmd.Parameters.AddWithValue("@nome", namecontact.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/contacts.aspx");
        }
    }

    
}