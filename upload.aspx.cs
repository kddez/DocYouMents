using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;

namespace ProjetoFinal
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getPropriedadesCookie("login");

            if (!IsPostBack)
            {
                string[] caminhoArquivos = Directory.GetFiles(Server.MapPath("~/uploads/"));
                List<ListItem> arquivos = new List<ListItem>();
                foreach (string filePath in caminhoArquivos)
                {
                    arquivos.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
                gvArquivos.DataSource = arquivos;
                gvArquivos.DataBind();
            }
        }



        protected void DownloadArquivo(object sender, EventArgs e)
        {
            try
            {
                string caminhoArquivo = (sender as LinkButton).CommandArgument;
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(caminhoArquivo));
                Response.WriteFile(caminhoArquivo);
                string nomedoc = caminhoArquivo;
                //capturar a string de conexão
                System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
                System.Configuration.ConnectionStringSettings connString3;
                connString3 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //cria um objeto de conexão
                SqlConnection con3 = new SqlConnection();
                con3.ConnectionString = connString3.ToString();
                SqlCommand cmd3 = new SqlCommand();
                cmd3.Connection = con3;
                // Faz a inserção no Banco de dados [Documentos]
                cmd3.CommandText = "Insert into documento (titulo,id_usuario,tipo,caminho) values (@titulo,@id_usuario,@tipo,@caminho)";
                cmd3.Parameters.AddWithValue("titulo", "");
                cmd3.Parameters.AddWithValue("id_usuario", ltrCookie.Text);
                cmd3.Parameters.AddWithValue("tipo", "Arquivo");
                cmd3.Parameters.AddWithValue("caminho", caminhoArquivo);
                con3.Open();
                cmd3.ExecuteNonQuery();

                // Cria as informações do LOG
                System.Configuration.ConnectionStringSettings connString4;
                connString4 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //capturar a string de conexão                    
                connString4 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //cria um objeto de conexão
                SqlConnection con4 = new SqlConnection();
                con4.ConnectionString = connString4.ToString();
                SqlCommand cmd4 = new SqlCommand();
                cmd4.Connection = con4;
                // Faz a inserção no Banco de dados [LOG]
                cmd4.CommandText = "Insert into log (id_usuario,titulo_documento,tipo_log) values (@id_usuario,@titulo_documento,@tipo_log)";
                // Passagem dos valores das variáveis
                cmd4.Parameters.AddWithValue("id_usuario", ltrCookie.Text);
                cmd4.Parameters.AddWithValue("titulo_documento", nomedoc);
                cmd4.Parameters.AddWithValue("tipo_log", "Download");
                con4.Open();
                cmd4.ExecuteNonQuery();
                con4.Close();

                
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }

        }


        protected void DeletarArquivo(object sender, EventArgs e)
        {

            try
            {

                //capturar a string de conexão
                System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
                System.Configuration.ConnectionStringSettings connString2;
                connString2 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //cria um objeto de conexão
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = connString2.ToString();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con2;
                // Faz a inserção no Banco de dados [Documentos]
                cmd2.CommandText = "Insert into documento (titulo,id_usuario,tipo,caminho) values (@strFileName,@id_usuario,@tipo,@caminho)";
                cmd2.Parameters.AddWithValue("strFileName", "Betoven");
                cmd2.Parameters.AddWithValue("id_usuario", ltrCookie.Text);
                cmd2.Parameters.AddWithValue("tipo", "Arquivo");
                cmd2.Parameters.AddWithValue("caminho", "Projetos/TimeOut");
                con2.Open();
                cmd2.ExecuteNonQuery();

                // Cria as informações do LOG
                System.Configuration.ConnectionStringSettings connString3;
                connString3 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //capturar a string de conexão                    
                connString3 = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
                //cria um objeto de conexão
                SqlConnection con3 = new SqlConnection();
                con3.ConnectionString = connString3.ToString();
                SqlCommand cmd3 = new SqlCommand();
                cmd3.Connection = con3;
                // Faz a inserção no Banco de dados [LOG]
                cmd3.CommandText = "Insert into log (id_usuario,titulo_documento,tipo_log) values (@id_usuario,@titulo_documento,@tipo_log)";
                // Passagem dos valores das variáveis
                cmd3.Parameters.AddWithValue("id_usuario", ltrCookie.Text);
                cmd3.Parameters.AddWithValue("titulo_documento", "Documento.aspx");
                cmd3.Parameters.AddWithValue("tipo_log", "Exclusão");
                con3.Open();
                cmd3.ExecuteNonQuery();
                con3.Close();

            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }

            string caminhoArquivo = (sender as LinkButton).CommandArgument;
            File.Delete(caminhoArquivo);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        public void getPropriedadesCookie(string nomeCookie)
        {
            // Obtém a requisição com dos dados do cookie
            HttpCookie cookie = ObterRequisicaoCookie(nomeCookie);
            if (cookie != null)
            {
                // Separa os valores das propriedade
                string valores = cookie.Value.ToString();
                // Varre os valores das propriedades encontrados               
                // Escreve os valores das propriedades encontradas
                ltrCookie.Text = valores;
            }
            else ltrCookie.Text = string.Empty;
        }

        /*
         * Método 03
         * Método responsável por Obter a requisição HttpCookie de um determinado cookie caso ele exista
         */
        private HttpCookie ObterRequisicaoCookie(string nomeCookie)
        {
            try
            {
                // Retornando o cookie caso exista
                return this.Page.Request.Cookies[nomeCookie];
            }
            catch
            {
                // Caso não exista o cookie informado, retorna NULL
                return null;
            }
        }

        /*
        * Método 04
        * Método responsável por remover um determinado cookie
        */

        protected void btnLer_Click(object sender, EventArgs e)
        {
            getPropriedadesCookie("login");
        }

        protected void gvArquivos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}