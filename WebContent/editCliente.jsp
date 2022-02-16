<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="classes.*"%>
<%@page errorPage="PaginaErro.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale = 1, shrink-to-fit=no">
	<title>Template Master</title>
	<link rel="stylesheet" type="text/css" href="bibliotecas/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bibliotecas/font-awesome/css/font-awesome.min.css">
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
	 <jsp:useBean id="clienteBean" class="classes.Cliente" scope="request"/>
     <jsp:setProperty name="clienteBean" property="idCliente" param="idCliente" />
        <%  
        Cliente c = clienteBean.buscarID(); 
        String id = String.valueOf(clienteBean.getIdCliente());	
        %>  
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
				
				<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">Editar Cliente</div>
			<div class="card-body">
                   <form method ="POST" action="direcionaEditCliente.jsp">
                    <input type="hidden" name="idCliente" value="<%=id%>"/>
					<div class="form-group">
						<label for="nomeCliente">Nome:</label>
						<input type="text" class="form-control" id="nome" name="nome"
						placeholder="Digite seu Nome:" value="<%=c.getNome()%>">
					</div>
					<div class="form-group">
						<label for="endCliente">Endereço:</label>
						<input type="text" class="form-control" id="endereco" name="endereco"
						placeholder="Digite seu Endereço:" value="<%=c.getEndereco()%>">
					</div>
					<div class="form-group">
						<label for="telCliente">Telefone:</label>
						<input type="text" class="form-control" id="telefone" name="telefone"
						placeholder="Digite seu Telefone" value="<%=c.getTelefone()%>">
					</div>
					<div class="form-group">
						<label for="cpfCliente">Cpf:</label>
						<input type="text" class="form-control" id="cpf" name="cpf"
						placeholder="Digite seu Cpf:" value="<%=c.getCpf()%>">
					</div>
					<button class="btn btn-primary btn-block">Editar</button>
				</form>
				</div>
			</div>
		</div>
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
	<script src="js/sb-admin.min.js" type="text/javascript"></script>
</body>
</html>