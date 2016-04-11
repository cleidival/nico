using System;
using System.Collections;
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

public partial class Processa : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd2;
    SqlDataReader rdr;

    string cons9, sql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        cons9 = @"Data Source = localhost\SHOPCONTROL9; " +
            "Initial Catalog=S9_Real;" +
            "User id=sa;" +
            "Password=Senha123; Min Pool Size=5;Max Pool Size=250; Connect Timeout=3000";

        con = new SqlConnection(cons9);

        if(Request.QueryString["Pagina"].ToString() == "AlterarFiltros"){
            if(Request.QueryString["Acao"].ToString() ==  "consultarNomeFiltros"){
                getNomeFiltro(Request.QueryString["Objeto"].ToString(), Request.QueryString["Codigo"].ToString());
            }else
            if(Request.QueryString["Acao"].ToString() ==  "mostrarReultadosAlterarFiltros"){
				string classe = Request.QueryString["Classe"].ToString();
		        string subclasse = Request.QueryString["Subclasse"].ToString();
		        string grupo = Request.QueryString["Grupo"].ToString();
		        string familia = Request.QueryString["Familia"].ToString();
		        string pesquisa_1 = Request.QueryString["Pesquisa_1"].ToString();
		        string pesquisa_2 = Request.QueryString["Pesquisa_2"].ToString();
		        string pesquisa_3 = Request.QueryString["Pesquisa_3"].ToString();
		        string fabricante = Request.QueryString["Fabricante"].ToString();		        
		        string NCM = Request.QueryString["NCM"].ToString();
		        string descricao1 = Request.QueryString["Descricao1"].ToString();
		        string descricao2 = Request.QueryString["Descricao2"].ToString();

		        mostarResultadoAlterarFiltros(classe, subclasse, grupo, familia, pesquisa_1, pesquisa_2, pesquisa_3, fabricante, NCM, descricao1, descricao2);
            }else
            if(Request.QueryString["Acao"].ToString() ==  "confirmarAlteracaoFiltros"){
				/*FILTROS A SEREM ALTERADOS*/
				string codigo_produtos = Request.QueryString["Codigos_produtos"].ToString();
				string classe = Request.QueryString["Classe"].ToString();
		        string subclasse = Request.QueryString["Subclasse"].ToString();
		        string grupo = Request.QueryString["Grupo"].ToString();
		        string familia = Request.QueryString["Familia"].ToString();
		        string pesquisa_1 = Request.QueryString["Pesquisa_1"].ToString();
		        string pesquisa_2 = Request.QueryString["Pesquisa_2"].ToString();
		        string pesquisa_3 = Request.QueryString["Pesquisa_3"].ToString();
		        string fabricante = Request.QueryString["Fabricante"].ToString();		        
		        string NCM = Request.QueryString["NCM"].ToString();
		        string descricao1 = Request.QueryString["Descricao1"].ToString();
		        string descricao2 = Request.QueryString["Descricao2"].ToString();
		        /*NOVOS FILTROS*/
				string classeNovo = Request.QueryString["ClasseNovo"].ToString();
		        string subclasseNovo = Request.QueryString["SubclasseNovo"].ToString();
		        string grupoNovo = Request.QueryString["GrupoNovo"].ToString();
		        string familiaNovo = Request.QueryString["FamiliaNovo"].ToString();
		        string pesquisa_1Novo = Request.QueryString["Pesquisa_1Novo"].ToString();
		        string pesquisa_2Novo = Request.QueryString["Pesquisa_2Novo"].ToString();
		        string pesquisa_3Novo = Request.QueryString["Pesquisa_3Novo"].ToString();
		        string fabricanteNovo = Request.QueryString["FabricanteNovo"].ToString();		        
		        string NCMNovo = Request.QueryString["NCMNovo"].ToString();
		        string nomeNovo = "";//Request.QueryString["NovoNome"].ToString();

		        confirmarAlteracaoFiltros(codigo_produtos, classe, subclasse, grupo, familia, pesquisa_1, pesquisa_2, pesquisa_3, fabricante, NCM, descricao1, descricao2, classeNovo, subclasseNovo, grupoNovo, familiaNovo, pesquisa_1Novo, pesquisa_2Novo, pesquisa_3Novo, fabricanteNovo, NCMNovo, nomeNovo);
            }

        }else
            if(Request.QueryString["Pagina"].ToString() == "AtualizarNCM"){
		string txtNCM = Request.QueryString["txtNCM"].ToString();
		string txtOrdemMovimento = Request.QueryString["txtOrdemMovimento"].ToString();
		string txtOrdemProdServ = Request.QueryString["txtOrdemProdServ"].ToString();
		string txtOrdemMovimentoProdServ = Request.QueryString["txtOrdemMovimentoProdServ"].ToString();
                atualizarNCM(txtNCM, txtOrdemMovimento, txtOrdemProdServ, txtOrdemMovimentoProdServ);
            }else
	   if(Request.QueryString["Pagina"].ToString() == "RemarcarPrecos"){
                atualizarPrecos();
            }else
            if(Request.QueryString["Pagina"].ToString() == "ConfiguracoesPrecos"){
                if(Request.QueryString["Acao"].ToString() == "Verificar"){			
			        string classe = Request.QueryString["Classe"].ToString();
			        string subclasse = Request.QueryString["Subclasse"].ToString();
			        string grupo = Request.QueryString["Grupo"].ToString();
			        string familia = Request.QueryString["Familia"].ToString();
			        string fabricante = Request.QueryString["Fabricante"].ToString();
			        string tabela1 = Request.QueryString["Tabela1"].ToString();
			        string tabela2 = Request.QueryString["Tabela2"].ToString();
			        string percentual = Request.QueryString["Percentual"].ToString();
			        string operacao = Request.QueryString["Operacao"].ToString();

			        verificarConfiguracaoPrecosExiste(classe, subclasse, grupo, familia, fabricante, tabela1, tabela2, percentual, operacao);
			    }else
			        if(Request.QueryString["Acao"].ToString() == "Adicionar"){			
				        string classe = Request.QueryString["Classe"].ToString();
				        string subclasse = Request.QueryString["Subclasse"].ToString();
				        string grupo = Request.QueryString["Grupo"].ToString();
				        string familia = Request.QueryString["Familia"].ToString();
				        string fabricante = Request.QueryString["Fabricante"].ToString();
				        string tabela1 = Request.QueryString["Tabela1"].ToString();
				        string tabela2 = Request.QueryString["Tabela2"].ToString();
				        string percentual = Request.QueryString["Percentual"].ToString();
				        string operacao = Request.QueryString["Operacao"].ToString();

				        adicionarConfiguracaoPrecos(classe, subclasse, grupo, familia, fabricante, tabela1, tabela2, percentual, operacao);
			        }else
				        if(Request.QueryString["Acao"].ToString() == "Remover"){				
					        string ordem = Request.QueryString["Ordem"].ToString();
					        removerConfiguracaoPrecos(ordem);
				        }
            }
    }

    protected void mostarResultadoAlterarFiltros(string classe, string subclasse, string grupo, string familia, string pesquisa_1, string pesquisa_2, string pesquisa_3, string fabricante, string NCM, string descricao1, string descricao2){
        string sql = @"SELECT * FROM prod_serv WHERE ";
        if(classe.Length!=0){
        	sql += 	@" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classe+"') AND ";
        }
        if(subclasse.Length!=0){
        	sql += 	@" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasse+"') AND ";
        }
		if(grupo.Length!=0){
	        	sql += 	@" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupo+"') AND ";
	        }
		if(familia.Length!=0){
	        	sql += 	@" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familia+"') AND ";
	        }
		if(pesquisa_1.Length!=0){
	        	sql += 	@" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1+"') AND ";
	        }
		if(pesquisa_2.Length!=0){
	        	sql += 	@" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2+"') AND ";
	        }
		if(pesquisa_3.Length!=0){
	        	sql += 	@" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3+"') AND ";
	        }
		if(fabricante.Length!=0){
	        	sql += 	@" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricante+"') AND ";
	        }
	        if(NCM.Length!=0){
	        	sql += 	@" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCM+"') AND ";
	        }
		sql += @" (nome like '%" + descricao1 + "%' AND nome like '%" + descricao2 + "%') ORDER BY nome ";
        
        cmd = new SqlCommand(sql, con);
        con.Open();        
        rdr = cmd.ExecuteReader();
		Response.Write("<div class='table-responsive'>");
        Response.Write("<table class='table table-hover table-striped lista-ConfirmacaoProdutos'>");
        Response.Write("<thead>");
        Response.Write("<tr><th><input type='checkbox' name='codigo_todos' id='codigo_todos' Value='0' checked='checkbox'></th><th>CODIGO</th><th>NOME</th></tr>");
        Response.Write("</thead>");
        Response.Write("</tbody>");
        if (rdr.HasRows)
        {
		while(rdr.Read()){
			Response.Write("<tr><th><input type='checkbox' name='codigo_produtos'  Value='"+rdr["ordem"].ToString()+"' id='codigo_produtos' checked='checkbox'></th><td>"+rdr["codigo"].ToString()+"</td><td>"+rdr["nome"].ToString()+"</td></tr>");
		}
        }else{
        	Response.Write("<tr><td colspan='3'><div class='error'>Para os filtros NAO foi realizada NENHUMA ATUALIZACAO!</div></td></tr>");        	
        }
        Response.Write("</tbody></table></div>");
        //Response.Write(sql);
        rdr.Close();        
        con.Close();
        
    }
protected void confirmarAlteracaoFiltros(string codigos_produtos, string classe, string subclasse, string grupo, string familia, string pesquisa_1, string pesquisa_2, string pesquisa_3, string fabricante, string NCM, string descricao1, string descricao2, string classeNovo, string subclasseNovo, string grupoNovo, string familiaNovo, string pesquisa_1Novo, string pesquisa_2Novo, string pesquisa_3Novo, string fabricanteNovo, string NCMNovo, string nomeNovo){
		string sqlU = "";
		string sqlT = "";
		string condicao = "";
		string sql = @"SELECT * FROM prod_serv WHERE ";
		
		
		if(codigos_produtos.Length!=0){
        	sql += 	@" ordem in ("+codigos_produtos+") AND ";
        }
        if(classe.Length!=0){
        	sql += 	@" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classe+"') AND ";
        }
        if(subclasse.Length!=0){
        	sql += 	@" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasse+"') AND ";
        }
		if(grupo.Length!=0){
	        	sql += 	@" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupo+"') AND ";
	        }
		if(familia.Length!=0){
	        	sql += 	@" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familia+"') AND ";
	        }
		if(pesquisa_1.Length!=0){
	        	sql += 	@" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1+"') AND ";
	        }
		if(pesquisa_2.Length!=0){
	        	sql += 	@" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2+"') AND ";
	        }
		if(pesquisa_3.Length!=0){
	        	sql += 	@" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3+"') AND ";
	        }
		if(fabricante.Length!=0){
	        	sql += 	@" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricante+"') AND ";
	        }
	        if(NCM.Length!=0){
	        	sql += 	@" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCM+"') AND ";
	        }
		sql += @" (nome like '%" + descricao1 + "%' AND nome like '%" + descricao2 + "%') ORDER BY nome ";
        
       // Response.Write(sql);

        cmd = new SqlCommand(sql, con);
        con.Open();        
        rdr = cmd.ExecuteReader();
        string result = "";
        result += @"<div class='table-responsive'>";
        result += @"<table class='table table-hover table-striped lista-configuracoesPrecos'>";
        result += @"<thead>";
        result += @"<tr><th>CODIGO</th><th>NOME</th></tr>";
        result += @"</thead>";
        result += @"</tbody>";
        
		if (rdr.HasRows)
        {
			while(rdr.Read()){

				result += @"<tr><td>"+rdr["codigo"].ToString()+"</td><td>"+rdr["nome"].ToString()+"</td></tr>";

				sqlU = "";
				
		        if(classe!=classeNovo && classeNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classeNovo+"') ";		        	
		        }
		        if(subclasse!=subclasseNovo && subclasseNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasseNovo+"') ";		        	
		        }
				if(grupo!=grupoNovo && grupoNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupoNovo+"') ";			        
			   	}
				if(familia!=familiaNovo && familiaNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familiaNovo+"') ";			        
			    }
				if(pesquisa_1!=pesquisa_1Novo && pesquisa_1Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1Novo+"') ";
			    }
				if(pesquisa_2!=pesquisa_2Novo && pesquisa_2Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2Novo+"') ";			    
			    }
				if(pesquisa_3!=pesquisa_3Novo && pesquisa_3Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3Novo+"') ";			        
			    }
				if(fabricante!=fabricanteNovo && fabricanteNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricanteNovo+"') ";			        
			    }
		        if(NCM!=NCMNovo && NCMNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCMNovo+"') ";		        	
		        }		        
		        /*if(rdr["nome"]!=nomeNovo && nomeNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" nome='"+nomeNovo+"' ";		        	
		        }*/
		        if(sqlU.Length!=0){		        	
		        	sqlT += @"UPDATE prod_serv SET " + sqlU +  @" WHERE ordem='"+rdr["ordem"].ToString()+"';";			        			    
		        }
		        
			}
        }else{
        	result += @"<tr><td colspan='2'>NADA FOI ALTERADO</td></tr>";
        }
        result += @"</tbody></table></div>";
        
        //Response.Write("SQL: "+sqlT+"<BR>");
        rdr.Close();

		/*ATUALIZA PRODUTOS DE ACORDO COM O FILTROS INFORMADOS ANTERIORMENTE*/
        if(sqlT.Length!=0){
	        cmd2 = new SqlCommand(sqlT, con);        
	        cmd2.ExecuteNonQuery();
	        con.Close();	
	        Response.Write("<div class='success'>Produtos Atualizados com sucesso.</div>");
	        Response.Write(result);

        }else{
        	Response.Write("<div class='error'>Para os filtros NAO foi realizada NENHUMA ATUALIZACAO!</div>");
        }
        con.Close();
        
        
    }
    protected void getNomeFiltro(string tabela, string codigo){
    	
    	string nome = "NAO CADASTRADO";

    	if(codigo.Length!=0){
	    	string sql = @"SELECT top 1 nome FROM " + tabela + " WHERE codigo='" + codigo + "'";
	        
	        cmd = new SqlCommand(sql, con);
	        con.Open();
	        rdr = cmd.ExecuteReader();
	        if (rdr.HasRows)
	        {
	            rdr.Read();            
	            nome = rdr["nome"].ToString();            
	        }
	        rdr.Close();
	        con.Close();	
    	}
        
        Response.Write(nome);
    } 

    protected void atualizarNCM(string txtNCM, string txtOrdemMovimento, string txtOrdemProdServ, string txtOrdemMovimentoProdServ){

	string ordem_carga_tributaria = "";
	string ncm_nbs = "";
	string perc_federal_nacional = "";
	string perc_federal_importado = "";
	string perc_estadual = "";
	string perc_municipal = "";
	string chave = "";
	string fonte = "";
	bool ncm_existe = false;

	try{
            string sql = @"select * from Carga_Tributaria_Estados where estado='PA' AND NCM_NBS='"+txtNCM+"'";
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();			
	    rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
	        {
	            rdr.Read();            
		    ordem_carga_tributaria = rdr["ordem"].ToString();
		    ncm_nbs = rdr["ncm_nbs"].ToString();
		    perc_federal_nacional = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_federal_nacional"].ToString())).Replace(",",".");
		    perc_federal_importado = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_federal_importado"].ToString())).Replace(",",".");
		    perc_estadual = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_estadual"].ToString())).Replace(",",".");
		    perc_municipal = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_municipal"].ToString())).Replace(",","."); 
		    chave = rdr["chave"].ToString(); 
		    fonte = rdr["fonte"].ToString();
		    ncm_existe = true;
	        }

	        rdr.Close();
	        con.Close();            
		if(ncm_existe){
			atualizarMovimentoProdServ(txtOrdemMovimentoProdServ, ncm_nbs, perc_federal_nacional, perc_federal_importado, perc_estadual, perc_municipal, chave, fonte);
			atualizarProdServ(txtOrdemProdServ, ncm_nbs);
			atualizarProdServCargaTributaria(txtOrdemProdServ, perc_federal_nacional, perc_federal_importado, perc_estadual, perc_municipal, chave, fonte);
			Response.Write("PFN:"+perc_federal_nacional+"|PFI:"+perc_federal_importado+"|PE:"+perc_estadual+"|PM:"+perc_municipal+"|FONTE:IBPT");
		}else{
			Response.Write("NCM invalido!");
		}
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
   }

    protected void atualizarProdServCargaTributaria(string txtOrdemProdServ, string perc_federal_nacional, string perc_federal_importado, string perc_estadual, string perc_municipal, string chave, string fonte){
	try{
            string sql = @"select * from Prod_Serv_Carga_Tributaria where Ordem_Prod_Serv='"+txtOrdemProdServ+"' and Estado='PA'";
	    bool prod_serv_carga_tributaria_exite = false;
	    //Response.Write(sql);
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();	
	    rdr = cmd.ExecuteReader();
	    if(rdr.HasRows){
		prod_serv_carga_tributaria_exite = true;
	    }	
            con.Close();

	    if(!prod_serv_carga_tributaria_exite){
	        sql = @"insert into Prod_Serv_Carga_Tributaria
(Ordem_Prod_Serv,estado,Zero_Nao_Mostrar,Perc_Federal_Nacional,Perc_Federal_Importado,Perc_Estadual,Perc_Municipal,Chave,Fonte)values('"+txtOrdemProdServ+"','PA','0','"+perc_federal_nacional+"','"+perc_federal_importado+"','"+perc_estadual+"','"+perc_municipal+"','"+chave+"','"+fonte+"')";
		//Response.Write(sql);
	        cmd = new SqlCommand(sql, con);	        
        	con.Close();
	        con.Open();	
        	cmd.ExecuteNonQuery();            
		con.Close();		
	    }
	}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }

	protected void atualizarProdServ(string txtOrdemProdServ, string ncm_nbs){
	try{
            string sql = @"update prod_serv set ordem_ncm=(select top 1 ordem from ncm where codigo='"+ncm_nbs+"') where ordem='" + txtOrdemProdServ+ "'";
	    //Response.Write(sql);
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();			
            cmd.ExecuteNonQuery();            
            con.Close();
	}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }

    protected void atualizarMovimentoProdServ(string txtOrdemMovimentoProdServ, string ncm_nbs, string perc_federal_nacional, string perc_federal_importado, string perc_estadual, string perc_municipal, string chave, string fonte){
	try{
            string sql = @"update movimento_prod_serv set ordem_ncm=(select top 1 ordem from ncm where codigo='"+ncm_nbs+"'), ncm='"+ncm_nbs+"', carga_tributaria_federal_perc='"+perc_federal_nacional+"', carga_tributaria_estadual_perc='"+perc_estadual+"', carga_tributaria_municipal_perc='"+perc_municipal+"', carga_tributaria_fonte2='"+fonte+"' where ordem='"+txtOrdemMovimentoProdServ+"'";
	    //Response.Write(sql);
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();			
	    cmd.ExecuteNonQuery();            
            con.Close(); 
	}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }
   
    protected void atualizarPrecos(){
        string data_inicial = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
        string data_final = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
		try{
            
            cmd = new SqlCommand("spRemarcacaoPrecos", con);
	        cmd.CommandTimeout = 3000;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@tipo", SqlDbType.VarChar).Value = 'v';
            con.Close();
            con.Open();			
            cmd.ExecuteNonQuery();            
            con.Close();            
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
   } 
	protected void adicionarConfiguracaoPrecos(string classe, string subclasse, string grupo, string familia, string fabricante, string tabela1, string tabela2, string percentual, string operacao){
        string data_inicial = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
        string data_final = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
		try{

	        string sql = @"INSERT INTO x_cfsis_remarcacao_preco(ordem_classe, ordem_subclasse, ordem_grupo, ordem_familia, ordem_fabricante, ordem_tabela_1, ordem_tabela_2, valor, aumenta_diminui) VALUES('"+classe+"', '"+subclasse+"', '"+grupo+"', '"+familia+"', '"+fabricante+"', '"+tabela1+"', '"+tabela2+"', '"+percentual+"', '"+operacao+"')";
			//Response.Write(sql);
			cmd = new SqlCommand(sql, con);
	        	con.Open();
			cmd.ExecuteNonQuery();
	        	con.Close();
	            
	    }catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 
	protected void verificarConfiguracaoPrecosExiste(string classe, string subclasse, string grupo, string familia, string fabricante, string tabela1, string tabela2, string percentual, string operacao){
        
		try{

			string sql = @"SELECT TOP 1 * FROM x_cfsis_remarcacao_preco WHERE ordem_classe='"+classe+"' AND ordem_subclasse='"+subclasse+"' AND ordem_grupo='"+grupo+"' AND ordem_familia='"+familia+"' AND ordem_fabricante='"+fabricante+"' AND ordem_tabela_1='"+tabela1+"' AND ordem_tabela_2='"+tabela2+"'";
			//Response.Write(sql);
			cmd = new SqlCommand(sql, con);
	        con.Open();
			rdr = cmd.ExecuteReader();
			if(rdr.HasRows){
				Response.Write("Suspend:Ja existe configuracao de Precos Cadastrada!");
			}else{
				Response.Write("Success:configuracao de Precos NAO Cadastrada!");
			}
	        con.Close();
	            
	    }catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 

protected void removerConfiguracaoPrecos(string ordem){
	try{
	        string sql = @"DELETE FROM x_cfsis_remarcacao_preco WHERE ordem="+ordem;
            Response.Write(sql);
		    cmd = new SqlCommand(sql, con);
        	con.Open();
		    cmd.ExecuteNonQuery();
        	con.Close();
            
            
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }
}

}
