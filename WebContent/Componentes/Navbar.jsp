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
			<div class="navbar-nav">
				<a class="nav-link text-white" href="Home.jsp">Inicio</a> <a
					class="nav-link text-white" href="Transferir.jsp">Transferir</a> <a
					class="nav-link text-white" href="Prestamos.jsp">Préstamos</a> <a
					class="nav-link text-white" href="DatosPersonales.jsp">Datos
					personales</a>
			</div>

			<%
				if (session.getAttribute("sessionLogin") == null) {
			%>
			<!-- Contenedor separado para los botones a la derecha -->
			<div class="ms-auto">
				<a class="navbar-btn navbar-btn-right" href="Registro.jsp">Quiero
					ser Cliente</a> <a class="navbar-btn navbar-btn-right" href="Login.jsp">Banca
					Online</a>
			</div>
			<%
				} else {
			%>
			<div class="ms-auto">
				<a class="btn btn-success me-2" href="Perfil.jsp">Mi perfil</a> <a
					class="btn btn-danger" href="Logout.jsp">Salir</a>
			</div>
			<%
				}
			%>
		</div>
	</div>
</nav>
