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
   		
	 if(Session["usuario"] != null)
        {
         Session["usuario"] = "usuario logado";
//	 Response.Write(Session["usuario"]);
        }else{
		//Response.Write("usuario deve fazer login");
	         Session["usuario"] = "usuario logado";
	}
/*
	try{
		cons9 = @"Data Source = localhost\SHOPCONTROL9; " +
		        "Initial Catalog=S9_Real;" +
	        	"User id=sa;" +
		        "Password=Senha123;";
	    
		con = new SqlConnection(cons9);
		con.Open();
	}catch(Exception ex){Response.Write("Erro ao tentar conectar na base de dados");}*/
		
  }

    
}
