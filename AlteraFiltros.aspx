﻿<%@ Page language="c#" Inherits="Nico" CodeFile="AlteraFiltros.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - NICO</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>'
    <![endif]-->
	<style>
	.group-text{border: 1px solid #ccc; padding: 5px; border-radius:10px; background: #f1f1f1;}		
	.resultados{margin-top: 100px;font-size: 14pt;}
	#txtPesquisaClasse{text-transform:uppercase; }
	.lista-classes tbody>tr{cursor: pointer;}
	.table tr{cursor: pointer;}
	#filtrosAtuais{width: 450px; padding: 0px; display: block; float: left;}
	#filtrosNovos{width: 450px; padding: 0px; display: block; float: left;}
	.bgCinza{background: #f1f1f1; padding: 0px 20px;}
	.red{color: red;}
	#resultadoAlteracaoFiltros{display: block; width: auto; height:500px; background: #f1f1f1; border: 1px solid #ccc; overflow: auto;}
	.group-text{border: 1px solid #ccc; padding: 5px;border-radius:10px; background: #f1f1f1;}
	.msgProcessando{background: #1A1A1A url('img/loading.gif') no-repeat center; display: none; text-align: center; font-size: 14pt; color: #fff; height: 300px; line-height: 300px;}
	.msgResultado{display: none; text-align: center; font-size: 14pt; background: #5cb85c; color: #fff; z-index: 999;}
	.status{text-align: center; display: none; font-size: 14pt; width: 100%;}
	.success{color: #090;}
    .error{color: #900;}
	</style>
  </head>

  <body>

    
  <div class="container">

      <!-- #include file="Menu.aspx" -->
      
      <div class="container">
      <!-- Main component for a primary marketing message or call to action -->
      <div class="row bgCinza">
        <h2>Altera Filtros</h2>
        


	
<div id="filtrosAtuais">        
        <form>
      <table class="table">            
            <tbody>
              <!-- INICIO CLASSE -->
              <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoClasses">Classe</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoClasses" name="txtCodigoClasses">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasses">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalClasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classes</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Classes" name="txtPesquisaClasses">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classes",""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeClasses"></span></td>                
              </tr>
              <!-- FIM CLASSE -->
              
              <!-- INICIO SUBCLASSE -->
              <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoSubclasses">Subclasse</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoSubclasses" name="txtCodigoSubclasses">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalSubclasses">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalSubclasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Subclasses</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Subclasses" name="txtPesquisaSubclasses">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                                <% listaFiltros("Subclasses", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeSubclasses"></span></td>                
              </tr>
               <!-- FIM SUBCLASSE -->
               
               <!-- INICIO GRUPO -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoGrupos">Grupo</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoGrupos" name="txtCodigoGrupos">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGrupos">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalGrupos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Grupos</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Grupos" name="txtPesquisaGrupos">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Grupos", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeGrupos"></span></td>                
              </tr>
               <!-- FIM GRUPO -->
               
               <!-- INICIO FAMILIA -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoFamilias">Familias</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoFamilias" name="txtCodigoFamilias">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalFamilias">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalFamilias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Familias</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Familias" id="txtPesquisaFamilias" name="txtPesquisaFamilias">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Familias", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeFamilias"></span></td>                
              </tr>
               <!-- FIM FAMILIA -->
               
               <!-- INICIO PESQUISA 1-->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoPesquisa_1">Pesquisa_1</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoPesquisa_1" name="txtCodigoPesquisa_1">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_1">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 1</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_1" id="Text6" name="txtPesquisaPesquisa_1">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_1", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomePesquisa_1"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 2 -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoPesquisa_2">Pesquisa_2</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoPesquisa_2" name="txtCodigoPesquisa_2">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_2">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 2</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_2" id="Text8" name="txtPesquisaPesquisa_2">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_2", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomePesquisa_2"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 3 -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoPesquisa_3">Pesquisa_3</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoPesquisa_3" name="txtCodigoPesquisa_3">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_3">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 3</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_3" id="txtPesquisaPesquisa_3" name="txtPesquisaPesquisa_3">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_3", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomePesquisa_3"></span></td>                
              </tr>
               <!-- FIM PESQUISA 3 -->
               
               <!-- INICIO FABRICANTE -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoFabricantes">Fabricante</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoFabricantes" name="txtCodigoFabricantes">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalFabricantes">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalFabricantes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Fabricantes</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Fabricantes" id="txtPesquisaFabricantes" name="txtPesquisaFabricantes">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Fabricantes", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeFabricantes"></span></td>                
              </tr>
               <!-- FIM FABRICANTE -->
               
               
               
               <!-- INICIO NCM -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNCM">NCM</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNCM" name="txtCodigoNCM">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNCM">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNCM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>NCM</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NCM" id="Text18" name="txtPesquisaLocalizacoes">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("NCM", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNCM"></span></td>                
              </tr>
               <!-- FIM NCM --> 

               <!-- INICIO CLASSE IMPOSTO SAIDA -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoClasse_Imposto-S">C. Imposto Saidas</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoClasse_Imposto-S" name="txtCodigoClasse_Imposto-S">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasse_Imposto-S">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalClasse_Imposto-S" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Saidas</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Classe_Imposto-S" id="txtPesquisaClasse_Imposto-S" name="txtPesquisaClasse_Imposto-S">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-S", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeClasse_Imposto-S"></span></td>                
              </tr>
               <!-- FIM  CLASSE IMPOSTO SAIDA --> 

               <!-- INICIO  CLASSE IMPOSTO ENTRADA -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoClasse_Imposto-E">C. Imposto Entrada</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoClasse_Imposto-E" name="txtCodigoClasse_Imposto-E">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasse_Imposto-E">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalClasse_Imposto-E" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Entrada</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-Classe_Imposto-E" id="txtPesquisaClasse_Imposto-E" name="txtPesquisaClasse_Imposto-E">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-E", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeClasse_Imposto-E"></span></td>                
              </tr>
               <!-- FIM  CLASSE IMPOSTO ENTRADA-->               
               
               <!-- INICIO DESCRICAO -->               
               <tr class="active">
                <td colspan="2">                    
                    <div class="row">
					    <div class="col-lg-6"><label>Descrição 1</label><input type="text" class="form-control" id="txtDescricao1" name="txtDescricao1"></div>
					    <div class="col-lg-6"><label>Descrição 2</label><input type="text" class="form-control" id="txtDescricao2" name="txtDescricao2"></div>							    
				    </div>				    
				</td>               
              </tr>
              <!-- FIM DESCRICAO -->
                        
	    </tbody>
          </table> 
           <div class="row bgCinza">
            <button class="btn btn-primary" id="btnProcessarSolicitacao" style="width: 100%"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>&nbsp;Processar</button>
           </div>
           <div style="clear: both;">&nbsp;</div>
            </form>          
            </div>
 
<!--
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
/************************************************************************************************************************************************************
-->


































 
 	
<div id="filtrosNovos">        
        <form>
      <table class="table">            
            <tbody>
              <!-- INICIO CLASSE -->
              <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoClasses">Classe</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoClasses" name="txtCodigoNovoClasses">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoClasses">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoClasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classes</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoClasses" name="txtPesquisaClasses">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classes","Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoClasses"></span></td>                
              </tr>
              <!-- FIM CLASSE -->
              
              <!-- INICIO SUBCLASSE -->
              <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoSubclasses">Subclasse</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoSubclasses" name="txtCodigoSubclasses">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoSubclasses">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoSubclasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Subclasses</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoSubclasses" name="txtPesquisaSubclasses">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                                <% listaFiltros("Subclasses", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoSubclasses"></span></td>                
              </tr>
               <!-- FIM SUBCLASSE -->
               
               <!-- INICIO GRUPO -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoGrupos">Grupo</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoGrupos" name="txtCodigoNovoGrupos">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoGrupos">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoGrupos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Grupos</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoGrupos" name="txtPesquisaGrupos">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Grupos", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoGrupos"></span></td>                
              </tr>
               <!-- FIM GRUPO -->
               
               <!-- INICIO FAMILIA -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoFamilias">Familias</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoFamilias" name="txtCodigoNovoFamilias">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoFamilias">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoFamilias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Familias</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoFamilias" id="Text5" name="txtPesquisaFamilias">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Familias", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoFamilias"></span></td>                
              </tr>
               <!-- FIM FAMILIA -->
               
               <!-- INICIO PESQUISA 1-->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoPesquisa_1">Pesquisa_1</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoPesquisa_1" name="txtCodigoNovoPesquisa_1">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_1">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 1</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_1" id="Text9" name="txtPesquisaPesquisa_1">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_1", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_1"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 2 -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoPesquisa_2">Pesquisa_2</label>
                    <div class="input-group">                    
					    <input type="text" class="form-control" id="txtCodigoNovoPesquisa_2" name="txtCodigoNovoPesquisa_2">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_2">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 2</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_2" id="Text11" name="txtPesquisaPesquisa_2">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_2", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_2"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 3 -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoPesquisa_3">Pesquisa_3</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoPesquisa_3" name="txtCodigoNovoPesquisa_3">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_3">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 3</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_3" id="Text13" name="txtPesquisaPesquisa_3">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_3", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_3"></span></td>                
              </tr>
               <!-- FIM PESQUISA 3 -->
               
               <!-- INICIO FABRICANTE -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoFabricantes">Fabricante</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoFabricantes" name="txtCodigoNovoFabricantes">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoFabricantes">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoFabricantes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Fabricantes</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoFabricantes" id="Text15" name="txtPesquisaFabricantes">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Fabricantes", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoFabricantes"></span></td>                
              </tr>
               <!-- FIM FABRICANTE -->
               
               
               <!-- FIM NCM -->
               <!-- INICIO NCM -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoNCM">NCM</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoNCM" name="txtCodigoNovoNCM">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoNCM">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoNCM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>NCM 2</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoNCM" id="Text20" name="txtPesquisaLocalizacoes">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("NCM", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoNCM"></span></td>                
              </tr>
               <!-- FIM LOCALIZACAO --> 

               <!-- INICIO classe imposto de saida -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoClasse_Imposto-S">C. Imposto Saidas</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoClasse_Imposto-S" name="txtCodigoNovoClasse_Imposto-S">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoClasse_Imposto-S">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoClasse_Imposto-S" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Saidas</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-modalCodigoNovoClasse_Imposto-S" id="Text18" name="txtPesquisaCodigoNovoClasse_Imposto-S">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-S", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoClasse_Imposto-S"></span></td>                
              </tr>
               <!-- FIM NCM --> 

               <!-- INICIO CLASSE IMPOSTO ENTRADA -->
                <tr class="active">
                <td width="150px">                    
                    <label for="txtCodigoNovoClasse_Imposto-E">C. Imposto Entrada</label>
                    <div class="input-group">
					    <input type="text" class="form-control" id="txtCodigoNovoClasse_Imposto-E" name="txtCodigoNovoClasse_Imposto-E">		
					    <div class="input-group-btn">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoClasse_Imposto-E">
							    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						    </button>	    
					    </div>
				    </div>			
				    <!-- Modal -->				    
                    <div style="width:auto;" class="modal fade" id="modalNovoClasse_Imposto-E" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Entrada</h4>
                          </div>                          
                          <div class="input-group well">
					            <input type="text" class="form-control txtPesquisa" alt="lista-NovoClasse_Imposto-E" id="Text18" name="txtPesquisaNovoClasse_Imposto-E">		
					            <div class="input-group-btn">
						            <button type="button" class="btn btn-primary" >
							            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						            </button>	    
					            </div>
				            </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-E", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
				</td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoClasse_Imposto-E"></span></td>                
              </tr>
               <!-- FIM  CLASSE IMPOSTO ENTRADA -->                               
               
                        
	    </tbody>
          </table> 
            </form>          
            </div>

		<div class="row" style="clear: both;padding: 0px; margin: 5px; margin-botom: 10px;">
			<button type="button" class="btn btn-danger" id="btnLimparCampos">
			   <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> LIMPAR CAMPOS
			</button>
	    </div>
    </div> <!-- /container -->
    
    


		<!-- Modal reaultados alteracao filtros-->				    
                    <div style="width:auto;" class="modal fade" id="modalListaResultadosAlterarFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog" style="width: 900px;">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>RESULTADOS: PRODUTOS ALTERADOS</h4>
				<p class="red"><b>ATENÇÃO:</b> Para finalizar a alteração de <u>Filtros Analise</u> os produtos abaixo logo após Clique em CONFIRMAR OU CANCELAR.</p>
                          </div>                          
                          <div class="modal-body">
                            <div id="resultadoAlteracaoFiltros"></div>
                          </div>                  
                          <div class="modal-footer">

				  <button type="button" class="btn btn-success" id="btnConfirmarAlteracaoFiltros">
					    <span class="glyphicon glyphicon-confirm" aria-hidden="true"></span> CONFIRMAR
				   </button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                          </div>                                  
                        </div>
                      </div>
                    </div>
               <!--Fim Modal-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datagrid.js"></script>
    <script src="js/main.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">
    
        var filial = $("#filialField").val();

        $("#filialField").change(function(){
            var url = "Caixa.aspx?filial="+$(this).val(); 
            if (url) { 
                window.location = url; 
            }
            return false;
        });


        $("#caixaField").change(function(){
           var url = "Caixa.aspx?filial="+filial+"&caixa="+$(this).val(); 
          if (url) { 
              window.location = url; 
          }
          return false;
        });
        
        /***
        Chama a funcao carregaNomeFiltro apos o cursor sair do campo atraves do evento 'BLUR'
        ***/  
        $("#txtCodigoClasses").blur(function(){carregaNomeFiltro("Classes","txtCodigoClasses","nomeClasses");});
        $("#txtCodigoSubclasses").blur(function(){carregaNomeFiltro("SubClasses","txtCodigoSubclasses","nomeSubclasses");});
        $("#txtCodigoGrupos").blur(function(){carregaNomeFiltro("Grupos","txtCodigoGrupos","nomeGrupos");});
        $("#txtCodigoFamilias").blur(function(){carregaNomeFiltro("Familias","txtCodigoFamilias","nomeFamilias");});
        $("#txtCodigoPesquisa_1").blur(function(){carregaNomeFiltro("Pesquisa_1","txtCodigoPesquisa_1","nomePesquisa_1");});
        $("#txtCodigoPesquisa_2").blur(function(){carregaNomeFiltro("Pesquisa_2","txtCodigoPesquisa_2","nomePesquisa_2");});
        $("#txtCodigoPesquisa_3").blur(function(){carregaNomeFiltro("Pesquisa_3","txtCodigoPesquisa_3","nomePesquisa_3");});
        $("#txtCodigoFabricantes").blur(function(){carregaNomeFiltro("Fabricantes","txtCodigoFabricantes","nomeFabricantes");});
        //$("#txtCodigoLocalizacoes").blur(function(){carregaNomeFiltro("Localizacoes","txtCodigoLocalizacoes","nomeLocalizacoes");});
        $("#txtCodigoNCM").blur(function(){carregaNomeFiltro("NCM","txtCodigoNCM","nomeNCM");});
        $("#txtCodigoClasse_Imposto-S").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoClasse_Imposto-S","nomeClasse_Imposto-S");});
        $("#txtCodigoClasse_Imposto-S").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoClasse_Imposto-E","nomeClasse_Imposto-E");});
        
        
        $("#txtCodigoNovoClasses").blur(function(){carregaNomeFiltro("Classes","txtCodigoNovoClasses","nomeNovoClasses");});
        $("#txtCodigoNovoSubclasses").blur(function(){carregaNomeFiltro("Subclasses","txtCodigoNovoSubclasses","nomeNovoSubclasses");});
        $("#txtCodigoNovoGrupos").blur(function(){carregaNomeFiltro("Grupos","txtCodigoNovoGrupos","nomeNovoGrupos");});
        $("#txtCodigoNovoFamilias").blur(function(){carregaNomeFiltro("Familias","txtCodigoNovoFamilias","nomeNovoFamilias");});
        $("#txtCodigoNovoPesquisa_1").blur(function(){carregaNomeFiltro("Pesquisa_1","txtCodigoNovoPesquisa_1","nomeNovoPesquisa_1");});
        $("#txtCodigoNovoPesquisa_2").blur(function(){carregaNomeFiltro("Pesquisa_2","txtCodigoNovoPesquisa_2","nomeNovoPesquisa_2");});
        $("#txtCodigoNovoPesquisa_3").blur(function(){carregaNomeFiltro("Pesquisa_3","txtCodigoNovoPesquisa_3","nomeNovoPesquisa_3");});
        $("#txtCodigoNovoFabricantes").blur(function(){carregaNomeFiltro("Fabricantes","txtCodigoNovoFabricantes","nomeNovoFabricantes");});
        //$("#txtCodigoNovoLocalizacoes").blur(function(){carregaNomeFiltro("Localizacoes","txtCodigoNovoLocalizacoes","nomeNovoLocalizacoes");});
        $("#txtCodigoNovoNCM").blur(function(){carregaNomeFiltro("NCM","txtCodigoNovoNCM","nomeNovoNCM");});
        $("#txtCodigoNovoClasse_Imposto-S").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoNovoClasse_Imposto-S","nomeNovoClasse_Imposto-S");});
        $("#txtCodigoNovoClasse_Imposto-E").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoNovoClasse_Imposto-E","nomeNovoClasse_Imposto-E");});
        

        function carregaNomeFiltro(tabela, campo, destino){        
            $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros","Objeto":tabela, "Acao":"consultarNomeFiltros", "Codigo":$('#'+campo).val()},
                success:function(data){ 
                	if(data!="NAO CADASTRADO"){
                		$('#'+destino).html(data);
                	}else{
                		$('#'+campo).val("");
                		$('#'+destino).html("");
                	}             
                }
            });        
        }
           
        $(".txtPesquisa").keyup(function(){
            var tabela = $(this).attr('alt');
            console.log("->"+tabela+" tbody>tr ->" + $(this).val());
            
            if($(this).val()!=""){
                $("."+tabela+" tbody>tr").hide();
                $("."+tabela+" td:contains('"+$(this).val().toUpperCase()+"')").parent("tr").show();
            }else{
                $("."+tabela+" tbody>tr").show();
            }            
        });
          
        $("table tr.codigoFiltro").click(function(e){  
            e.preventDefault();       
            var codigoNomeClasse = $(this).attr('value');
            var resultadoSplit = codigoNomeClasse.split(':');
            console.log(codigoNomeClasse+'\n'+resultadoSplit[0]+'\n'+resultadoSplit[1]+'\n'+resultadoSplit[2]+'\n resultado: '+"#txtCodigo"+resultadoSplit[2]);            
            $("#txtCodigo"+resultadoSplit[2]).val(resultadoSplit[0]);
            $("#nome"+resultadoSplit[2]).html(resultadoSplit[1]);
            $("#modal"+resultadoSplit[2]).modal('hide');
        });
        
        $("table tr.codigoNovoFiltro").click(function(e){  
            e.preventDefault();       
            var codigoNomeClasse = $(this).attr('value');
            var resultadoSplit = codigoNomeClasse.split(':');
            console.log(codigoNomeClasse+'\n'+resultadoSplit[0]+'\n'+resultadoSplit[1]+'\n'+resultadoSplit[2]+'\n resultado: '+"#txtNovoCodigo"+resultadoSplit[2]);
            $("#txtCodigoNovo"+resultadoSplit[2]).val(resultadoSplit[0]);
            $("#nomeNovo"+resultadoSplit[2]).html(resultadoSplit[1]);
            $("#modalNovo"+resultadoSplit[2]).modal('hide');
            console.log('\n#modalNovo'+resultadoSplit[2])
        });
        
        $("#btnProcessarSolicitacao").click(function(e){
			e.preventDefault();          	
			var classe = $("#txtCodigoClasses").val();
			var subclasse = $("#txtCodigoSubclasses").val();
			var grupo = $("#txtCodigoGrupos").val();
			var familia = $("#txtCodigoFamilias").val();
			var pesquisa_1 = $("#txtCodigoPesquisa_1").val();
			var pesquisa_2 = $("#txtCodigoPesquisa_2").val();
			var pesquisa_3 = $("#txtCodigoPesquisa_3").val();
			var fabricante = $("#txtCodigoFabricantes").val();      	  	
      var NCM = $("#txtCodigoNCM").val();
      var classe_imposto_s = $("#txtCodigoClasse_Imposto-S").val();
      var classe_imposto_e = $("#txtCodigoClasse_Imposto-E").val();
			var descricao1 = $("#txtDescricao1").val();
			var descricao2 = $("#txtDescricao2").val();

			var classeNovo = $("#txtCodigoNovoClasses").val();
			var subclasseNovo = $("#txtCodigoNovoSubclasses").val();
			var grupoNovo = $("#txtCodigoNovoGrupos").val();
			var familiaNovo = $("#txtCodigoNovoFamilias").val();
			var pesquisa_1Novo = $("#txtCodigoNovoPesquisa_1").val();
			var pesquisa_2Novo = $("#txtCodigoNovoPesquisa_2").val();
			var pesquisa_3Novo = $("#txtCodigoNovoPesquisa_3").val();
			var fabricanteNovo = $("#txtCodigoNovoFabricantes").val();      	  	
			var NCMNovo = $("#txtCodigoNovoNCM").val();
      var classe_imposto_sNovo = $("#txtCodigoNovoClasse_Imposto-S").val();
      var classe_imposto_eNovo = $("#txtCodigoNovoClasse_Imposto-E").val();
      
			var processa = false;

			processa = (!processa)?(classeNovo.length!=0?true:false):true;
			processa = (!processa)?(subclasseNovo.length!=0?true:false):true;
			processa = (!processa)?(grupoNovo.length!=0?true:false):true;
			processa = (!processa)?(familiaNovo.length!=0?true:false):true;
			processa = (!processa)?(pesquisa_1Novo.length!=0?true:false):true;
			processa = (!processa)?(pesquisa_2Novo.length!=0?true:false):true;
			processa = (!processa)?(pesquisa_3Novo.length!=0?true:false):true;
			processa = (!processa)?(fabricanteNovo.length!=0?true:false):true;
			processa = (!processa)?(NCMNovo.length!=0?true:false):true;
      processa = (!processa)?(classe_imposto_sNovo.length!=0?true:false):true;
      processa = (!processa)?(classe_imposto_eNovo.length!=0?true:false):true;
			console.log(processa);
	
			if(processa){
      
	            $.ajax({
	                url: "Processa.aspx",
	                data:{"Pagina":"AlterarFiltros","Acao":"mostrarReultadosAlterarFiltros", "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Pesquisa_1":pesquisa_1, "Pesquisa_2":pesquisa_2, "Pesquisa_3":pesquisa_3, "Fabricante":fabricante, "NCM":NCM, "classe_imposto_s":classe_imposto_s, "classe_imposto_e":classe_imposto_e, "Descricao1":descricao1, "Descricao2":descricao2},
	                beforeSend:function(){
	                	$("#resultadoAlteracaoFiltros").html("<div class='msgProcessando'>Aguarde enquanto processamos sua solicitacao...<span class='spanTimer'></span></div>");       
	                	$(".msgProcessando").show();					         	
						        $("#modalListaResultadosAlterarFiltros").modal();					
	                },
	                success:function(data){
        						$("#resultadoAlteracaoFiltros").html(data);                	
        						$(".msgProcessando").hide();
	                },
	                error:function(data){
	                	console.log('erro:' + data);
	                }                
	            });
	            }else{
	            	alert("Voce deve preencher pelo menos um FILTRO NOVO!");
	            }
            
        });

    $("#btnConfirmarAlteracaoFiltros").click(function(e){
    		e.preventDefault();  

         var codigos_produtos = "";	            

    		$(".lista-ConfirmacaoProdutos input:checked").each(function(){	            
            var elem = $(this);
            if(codigos_produtos.length!=0){	            	
            	codigos_produtos += ", '"+elem.val()+"'";	            
            }else{
            	codigos_produtos = "'"+elem.val()+"'";
            }
            
            
        });	 
        console.log('lista de codigos: '+codigos_produtos);

        var classe = $("#txtCodigoClasses").val();
        var subclasse = $("#txtCodigoSubclasses").val();
        var grupo = $("#txtCodigoGrupos").val();
        var familia = $("#txtCodigoFamilias").val();
        var pesquisa_1 = $("#txtCodigoPesquisa_1").val();
        var pesquisa_2 = $("#txtCodigoPesquisa_2").val();
        var pesquisa_3 = $("#txtCodigoPesquisa_3").val();
        var fabricante = $("#txtCodigoFabricantes").val();      	  	
        var NCM = $("#txtCodigoNCM").val();        
        var classe_imposto_s = $("#txtCodigoClasse_Imposto-S").val();
        var classe_imposto_e = $("#txtCodigoClasse_Imposto-E").val();
        var descricao1 = $("#txtDescricao1").val();
        var descricao2 = $("#txtDescricao2").val();

        var classeNovo = $("#txtCodigoNovoClasses").val();
        var subclasseNovo = $("#txtCodigoNovoSubclasses").val();
        var grupoNovo = $("#txtCodigoNovoGrupos").val();
        var familiaNovo = $("#txtCodigoNovoFamilias").val();
        var pesquisa_1Novo = $("#txtCodigoNovoPesquisa_1").val();
        var pesquisa_2Novo = $("#txtCodigoNovoPesquisa_2").val();
        var pesquisa_3Novo = $("#txtCodigoNovoPesquisa_3").val();
        var fabricanteNovo = $("#txtCodigoNovoFabricantes").val();      	  	
        var NCMNovo = $("#txtCodigoNovoNCM").val();        
        var classe_imposto_sNovo = $("#txtCodigoNovoClasse_Imposto-S").val();
        var classe_imposto_eNovo = $("#txtCodigoNovoClasse_Imposto-E").val();
          	
          	$.ajax({
          		url: "Processa.aspx",
          		data:{"Pagina":"AlterarFiltros", "Acao":"confirmarAlteracaoFiltros","Codigos_produtos":codigos_produtos, "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Pesquisa_1":pesquisa_1, "Pesquisa_2":pesquisa_2, "Pesquisa_3":pesquisa_3, "Fabricante":fabricante, "NCM":NCM, "classe_imposto_s": classe_imposto_s, "classe_imposto_e": classe_imposto_e, "Descricao1":descricao1, "Descricao2":descricao2, "ClasseNovo":classeNovo, "SubclasseNovo":subclasseNovo, "GrupoNovo":grupoNovo, "FamiliaNovo":familiaNovo, "Pesquisa_1Novo":pesquisa_1Novo, "Pesquisa_2Novo":pesquisa_2Novo, "Pesquisa_3Novo":pesquisa_3Novo, "FabricanteNovo":fabricanteNovo, "NCMNovo":NCMNovo, "classe_imposto_sNovo":classe_imposto_sNovo,"classe_imposto_eNovo":classe_imposto_eNovo},
          		beforeSend:function(){
                  	$("#resultadoAlteracaoFiltros").html("<div class='msgProcessando'>Aguarde enquanto processamos sua solicitacao...<span class='spanTimer'></span></div>");       
                  	$(".msgProcessando").show();					         						
                  },
          		success:function(data){console.log(data);$(".msgProcessando").hide();	$("#resultadoAlteracaoFiltros").html(data);	},
          		error:function(data){console.log(data);}
          	});
      });

        $("#btnLimparCampos").click(function(e){
        	e.preventDefault();  

			$("#txtCodigoClasses").val("");
			$("#nomeClasses").html("");
			$("#txtCodigoSubclasses").val("");
			$("#nomeSubclasses").html("");
			$("#txtCodigoGrupos").val("");
			$("#nomeGrupos").html("");
			$("#txtCodigoFamilias").val("");
			$("#nomeFamilias").html("");
			$("#txtCodigoPesquisa_1").val("");
			$("#nomePesquisa_1").html("");
			$("#txtCodigoPesquisa_2").val("");
			$("#nomePesquisa_2").html("");
			$("#txtCodigoPesquisa_3").val("");
			$("#nomePesquisa_3").html("");
			$("#txtCodigoFabricantes").val("");      	  	
			$("#nomeFabricantes").html("");
			$("#txtCodigoNCM").val("");
      $("#nomeNCM").html("");
      $("#txtCodigoClasse_Imposto-S").html("");
      $("#nomeClasse_Imposto-S").html("");
      $("#txtCodigoClasse_Imposto-E").html("");
      $("#nomeClasse_Imposto-E").html("");      
			$("#txtDescricao1").val("");			
			$("#txtDescricao2").val("");
			

			$("#txtCodigoNovoClasses").val("");
			$("#nomeNovoClasses").html("");
			$("#txtCodigoNovoSubclasses").val("");
			$("#nomeNovoSubclasses").html("");
			$("#txtCodigoNovoGrupos").val("");
			$("#nomeNovoGrupos").html("");
			$("#txtCodigoNovoFamilias").val("");
			$("#nomeNovoFamilias").html("");
			$("#txtCodigoNovoPesquisa_1").val("");
			$("#nomeNovoPesquisa_1").html("");
			$("#txtCodigoNovoPesquisa_2").val("");
			$("#nomeNovoPesquisa_2").html("");
			$("#txtCodigoNovoPesquisa_3").val("");
			$("#nomeNovoPesquisa_3").html("");
			$("#txtCodigoNovoFabricantes").val("");      	  	
			$("#nomeNovoFabricantes").html("");
			$("#txtCodigoNovoNCM").val("");	
			$("#nomeNovoNCM").html("");      
      $("#txtCodigoNovoClasse_Imposto-S").html("");
      $("#nomeNovoClasse_Imposto-S").html("");
      $("#txtCodigoNovoClasse_Imposto-E").html("");
      $("#nomeNovoClasse_Imposto-E").html("");      
        });

      
    </script>

  </body>
</html>

