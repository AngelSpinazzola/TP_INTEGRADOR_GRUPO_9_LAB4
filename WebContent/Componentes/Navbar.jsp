<%@page import="entidad.Usuario"%>
<nav class="navbar navbar-expand-lg navbar-dark text-white">
	<div class="container-fluid">
		<a class="navbar-brand text-white fw-bold titulo-navbar"
			href="Home.jsp">Banco UTN</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">

			<%
				if (session.getAttribute("usuario") == null) {
			%>
			<div class="ms-auto">
				<a class="navbar-btn navbar-btn-right" href="Login.jsp">Banca
					Online</a>
			</div>
			<%
				} else {
			%>
			<div class="navbar-nav">
				<a class="nav-link text-white" href="Home.jsp">Inicio</a> 
				<a class="nav-link text-white" href="ClienteTransferir.jsp">Transferir</a>
				<a class="nav-link text-white" href="Prestamos.jsp">Préstamos</a> 
				<a class="nav-link text-white" href="ClienteMovimientos.jsp">Movimientos</a>
			</div>
			<div class="ms-auto">
				<a class="btn btn-success me-2"  href="ClienteDatosSv?param=1">Mi perfil</a> 
				<a class="btn btn-success me-2" href="LogoutServlet">Salir</a>
			</div>
			<%
				}
			%>
		</div>
	</div>
</nav>
