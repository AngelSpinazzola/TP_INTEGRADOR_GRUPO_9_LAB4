<%@page import="entidad.Usuario"%>
<%@page import="entidad.Cliente"%>
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
			
			<%
			HttpSession MiSession = request.getSession(false);
			
			Cliente usuario = new Cliente();
			
			if (MiSession != null) {
	            // Obtener el objeto Cliente de la sesi�n
				usuario = (Cliente) MiSession.getAttribute("usuario");
	            if (usuario != null) {
	            } else {
	            	System.out.println("No hay usuario en la sesi�n.");
	            }
	        } else {
            	System.out.println("No hay sesi�n activa.");
	        }
			
		    int dniCliente = usuario.getDni();
			%>
			
			<div class="navbar-nav">
				<a class="nav-link text-white" href="Home.jsp">Inicio</a> 
				<a class="nav-link text-white" href="CargarDesplegablesSv?dni=<%= dniCliente %>&action=getCuentas">Transferir</a>
				<a class="nav-link text-white" href="CargarDesplegablesSv?dni=<%= dniCliente %>&action=getPrestamos">Prestamos</a> 
				<a class="nav-link text-white" href="CargarDesplegablesSv?dni=<%= dniCliente %>&action=getCuentasMov">Movimientos</a>
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
