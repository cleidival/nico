<%@ Page language="c#" Inherits="Nico" CodeFile="Default.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - PRODUTOS</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>


    <div class="container">

      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row">
        <h2>NCM - Consulta pública NCM Receita Federal</h2>
        <div class="form-group">	  
          <iframe src="http://www4.receita.fazenda.gov.br/simulador/PesquisarNCM.jsp?codigo=11&codigoCapitulo=11&codigoPosicao=0301&codigoSubPosicao1=03011&codigoSubPosicao2=030111" width="100%" height="400px;"></iframe>
        </div>

        <h2>CEST - codigo de produtos Substituição Tributária</h2>
        <div class="form-group">
		<iframe src="https://www.confaz.fazenda.gov.br/anexo-i.pdf" width="100%" height="600px;"></iframe>
        </div>
        <h2>CFOP -  Codigo de Operacao Fiscal</h2>
        <div class="form-group">
		<iframe src="http://www.sitecontabil.com.br/tabelas/cfop/pag_um.html" width="100%" height="600px;"></iframe>
        </div>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    

  </body>
</html>

