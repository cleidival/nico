using System;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Net;  
using System.IO;

public partial class Nico: System.Web.UI.Page 
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader rdr;

    string cons9, sql = "";

  protected void Page_Load(object sender, System.EventArgs e)
  {
   		
	try{
		cons9 = @"Data Source = localhost\SHOPCONTROL9; " +
		        "Initial Catalog=S9_Real;" +
	        	"User id=sa;" +
		        "Password=Senha123;";
	    
		con = new SqlConnection(cons9);
		con.Open();
	}catch(Exception ex){Response.Write("Erro ao tentar conectar na base de dados");}
		
  }

  protected void listaFiliais(){
		string filial = Request.QueryString["filial"];
		string sql = @"select * from filiais where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Close();
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<select name='filialField' id='filialField'  class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				if(filial == rdr["codigo"].ToString()){
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"' selected>"+rdr["nome"].ToString()+"</option>");
				}else{
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"'>"+rdr["nome"].ToString()+"</option>");
				}
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}

    
}
