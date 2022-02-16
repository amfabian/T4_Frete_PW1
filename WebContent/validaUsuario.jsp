<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="classes.Usuario"%>
<%@page errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale = 1, shrink-to-fit=no">
<title>Valida Usuario</title>
<link rel="stylesheet" type="text/css"
	href="bibliotecas/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="bibliotecas/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="bibliotecas/datatables/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css" href="css/sb-admin.min.css">
</head>

<body class="bg-dark fixed-nav sticky-footer" id="page-top">
	
	<jsp:useBean id="usuarioBean" class="classes.Usuario" scope="request" />
	<jsp:setProperty name="usuarioBean" property="*" />




	<div class="content-wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-12">
					<h1></h1>
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i>
				</div>
				<div class="card-body">


					<%
					if (usuarioBean.valida()) {
					%>
					<jsp:forward page="index.jsp">
						<jsp:param name="email" value="<%=usuarioBean.getEmail()%>" />
					</jsp:forward>
					<%
					} else {
					out.println("<br/>Usuario Inválido!");
					out.println("<br/><a href =userLogin.html> Voltar a tela de login </a>");
					}
					%>


				</div>
			</div>
		</div>
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright Seu Site 2017</small>
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
