<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="PaginaErro.jsp" %>
<%@page import="java.util.*"%>
<%@page import="fretes.*"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale = 1, shrink-to-fit=no">
	<title>Lista de Fretes</title>
	<link rel="stylesheet" type="text/css" href="bibliotecas/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bibliotecas/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="bibliotecas/datatables/dataTables.bootstrap4.css">
	<link rel="stylesheet" type="text/css" href="css/sb-admin.min.css">
</head>
<body class="bg-dark fixed-nav sticky-footer" id="page-top">
<!-- Navegação !-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
		<p class="navbar-brand">Admin Sistema</p>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
		data-target="#navbarInicio" aria-control="navbarInicio" aria-expanded="false" aria-label="Navegação Toggle">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbarInicio" class="collapse navbar-collapse">
			<ul class="navbar-nav navbar-sidenav" id="linksaccordion">
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="listClientes.jsp">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Início</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="listFretes.jsp">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Listar Fretes</span>
					</a>
				</li>
						
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="addCliente.jsp">
						<i class="fa fa-fw fa-dashboard"></i>
						<span class="nav-link-text">Cadastrar Cliente</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="listClientes.jsp">
						<i class="fa fa-fw fa-dashboard"></i>
						<span class="nav-link-text">Listar Clientes</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="listClientesEditar.jsp">
						<i class="fa fa-fw fa-dashboard"></i>
						<span class="nav-link-text">Editar Clientes</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="listClientesExcluir.jsp">
						<i class="fa fa-fw fa-dashboard"></i>
						<span class="nav-link-text">Excluir Clientes</span>
					</a>
				</li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item">
					<a id="sidenavToggler" class="nav-link text-center">
						<i class="fa fa-fw fa-angle-left"></i>
					</a>
				</li>
			</ul>
          <ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="invalidate.jsp">
						<i class="fa fa-sign-out">Logout</i>
					</a>
				</li>
			</ul>
		</div>
	</nav>
	<jsp:useBean id="freteBean" class="fretes.Frete" scope="request"/>
    <%  
        List<Frete> lista=freteBean.listarTodos();  
        request.setAttribute("listaReq",lista);  
    %>  
	<div class="content-wrapper">
		<div class="container-fluid">
			
			<div class="row">
				<div class="col-12">
					<h1>Fretes Cadastrados</h1>
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Fretes Cadastrados
				</div>
				<div class="card-body">
	
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>Valor</th>
								<th>Cidade Origem</th>
								<th>Cidade Destino</th>
								<th>Data</th>
								<th class="sorting_asc_disabled sorting_desc_disabled">Exclusão</th>								
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Valor</th>
								<th>Cidade Origem</th>
								<th>Cidade Destino</th>
								<th>Data</th>
								<th>Exclusão</th>								
							</tr>
						</tfoot>
						<tbody>
					     	<c:forEach var="frete" items="${listaReq}">
						    	<tr>
						           <td>${frete.getValor()}</td>
						    	   <td>${frete.getCidadeOrigem()}</td>
						    	   <td>${frete.getCidadeDestino()}</td>
						    	   <td>${frete.getData()}</td>
						   	   	   <td><a href="excluirFrete.jsp?idFrete=${frete.getIdFrete()}"> Excluir </a></td>						   	   	  
						    	</tr>
  					       </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
				<small>T4 Frete - Programação Web I - IFRS</small>
				</div>
			</div>
		</footer>
	</div>
	
	<script src="bibliotecas/jquery/jquery.min.js"></script>
	<script src="bibliotecas/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="bibliotecas/jquery-easing/jquery.easing.min.js"></script>
	<script src="bibliotecas/datatables/jquery.dataTables.js"></script>
	<script src="bibliotecas/datatables/dataTables.bootstrap4.js"></script>
	<script src="js/sb-admin.min.js" type="text/javascript"></script>
	<script src="js/sb-admin-datatables.min.js" type="text/javascript"></script>
</body>
</html>