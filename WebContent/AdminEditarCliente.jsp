<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidad.Provincia"%>
<%@ page import="entidad.Localidad"%>
<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Direccion"%>
<%@ page import="entidad.Usuario"%>


<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Banco UTN</title>

		<style>
		
		.hidden-label {
    	display: none;
		}
		.btn{
		padding-top: 50px;
		}
		* {
			box-sizing: border-box;
		}
		.container {
		    height: calc(100vh - 78px); 
		    position: relative;
		    overflow-y: hidden;
		}
		body {
			margin: 0;
			padding: 0;
			min-height: 100vh;
			position: relative;
			overflow-x: hidden;
		}
		
		.form-container {
			max-width: 800px;
			width: 100%;
			margin-top: -190px;
			padding: 2rem;
			background-color: white;
			border-radius: 8px;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.form-title {
			margin-top: 30px;
			padding-left: 200px;
			display: flex;
			position: relative;
			z-index: 1;
		}
		
		.d-flex {
			min-height: calc(100vh - 100px);
			height: auto;
			padding: 2rem 0;
		}
		
		.button-group {
			display: flex;
			justify-content: space-between;
			margin-top: 2rem;
		}
		
		.btn-general {
			width: 48%;
		}
		.row {
			margin-right: 0;
			margin-left: 0;
		}
		.p-4 {
			padding: 1.5rem !important;
		}
		.g-3 { -
			-bs-gutter-y: 1rem;
		}
		.form-control, .form-select {
			max-width: 100%;
		}
		</style>

		<%@ include file="Componentes/Head.jsp"%>
	</head>
	<body>
		<jsp:include page="Componentes/NavbarAdmin.jsp"></jsp:include>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Cliente cliente = (Cliente) request.getAttribute("cliente");

		if (cliente == null) {
			out.print("Cliente no encontrado.");
			return;
		}
		
		String nombreCliente = (cliente.getNombre() != null) ? cliente.getNombre() : "";
	    String apellidoCliente = (cliente.getApellido() != null) ? cliente.getApellido() : "";
	    String emailCliente = (cliente.getEmail() != null) ? cliente.getEmail() : "";
	    int dniCliente = (cliente.getDni() > 0) ? cliente.getDni() : 0;
	    String sexoCliente = (cliente.getSexo() != null) ? cliente.getSexo() : "";
	    String nacionalidadCliente = (cliente.getNacionalidad() != null) ? cliente.getNacionalidad() : "";
	    String cuilCliente = (cliente.getCuil() != null) ? cliente.getCuil() : "";
	    int estadoCliente = (cliente.getEstado() > 0) ? cliente.getEstado() : 0;
	    String telefonoCliente = (cliente.getNumeroTelefono() != null) ? cliente.getNumeroTelefono() : "";
	    java.sql.Date fechaNac = (cliente.getFechaNacimiento() != null) ? cliente.getFechaNacimiento() : null;
	    String fechaNacimiento = (fechaNac != null) ? fechaNac.toString() : "";

	    // Datos de Dirección
	    Direccion direccion = cliente.getDireccion();
	    int IdDireccion = (direccion != null && direccion.getIdDireccion() > 0) ? direccion.getIdDireccion() : 0;
	    String calleDireccion = (direccion != null && direccion.getCalle() != null) ? direccion.getCalle() : "";
	    int numeroDireccion = (direccion != null && direccion.getNumero() > 0) ? direccion.getNumero() : 0;
	    String codigoPostalDireccion = (direccion != null && direccion.getCodigoPostal() != null) ? direccion.getCodigoPostal() : "";

	    // Datos de Localidad
	    Localidad localidadCli = (direccion != null) ? direccion.getLocalidad() : null;
	    String nombreLocalidadCli = (localidadCli != null && localidadCli.getNombre() != null) ? localidadCli.getNombre() : "";

	    // Datos de Provincia
	    Provincia provinciaCli = (direccion != null) ? direccion.getProvincia() : null;
	    String nombreProvincia = (provinciaCli != null && provinciaCli.getNombre() != null) ? provinciaCli.getNombre() : "";

	    // Datos del Usuario
	    Usuario usuario = cliente.getUsuario();
	    String nombreUsuario = (usuario != null && usuario.getNombreUsuario() != null) ? usuario.getNombreUsuario() : "";
	    int estadoUsuario = (usuario != null) ? usuario.getEstado() : 0;
	    int tipoUsuario = (usuario != null) ? usuario.getTipo() : 0;
	    String passwordUsuario = (usuario != null && usuario.getPassword() != null) ? usuario.getPassword() : "";
	    int IDUsuario = (usuario != null && usuario.getId() > 0) ? usuario.getId() : 0;

	%>
	<div class="container">
		<!-- Contenedor principal del formulario -->
		<h3 class="form-title">Editar cliente</h3>
		<div class="d-flex justify-content-center align-items-center vh-100">
			<div class="p-4 border rounded shadow-lg bg-white form-container">
				<form action="EditarClientes" method="post">
					<div class="row g-3">
						<!-- Nombre y Apellido -->
						<div class="col-md-6">
							<label for="nombre" class="form-label">Nombre</label> <input
								type="text" id="nombre" name="nombre" class="form-control"
								value="<%= nombreCliente %>">
						</div>
						<div class="col-md-6">
							<label for="apellido" class="form-label">Apellido</label> <input
								type="text" id="apellido" name="apellido" class="form-control"
								value="<%= apellidoCliente %>" required>
						</div>

						<!-- DNI y CUIL -->
						<div class="col-md-6">
							<label for="dni" class="form-label">DNI:</label><br>
							<span><%=dniCliente%></span>
						    <input type="hidden" name="dni" value="<%=dniCliente%>">
						</div>
						
						<div class="col-md-6">
							<label for="cuil" class="form-label">CUIL:</label> <br>
							<span><%=cuilCliente%></span>
						    <input type="hidden" name="cuil" value="<%=cuilCliente%>">	
						</div>

						<!-- Email y Contraseña -->
						<div class="col-md-6">
							<label for="email" class="form-label">Email</label> <input
								type="email" id="email" name="email" class="form-control"
								value="<%= emailCliente %>" required>
						</div>
						<div class="col-md-6">
							<label for="password" class="form-label">Contrasenia</label> 
							<input type="password" id="password" name="password" class="form-control" onclick="togglePassword()" required value="<%= passwordUsuario %>" style="padding-right: 40px;"> 
							<span id="togglePassword" onclick="togglePassword()"
						        style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);
						               cursor: pointer; color: gray;">
						    </span>
						</div>
						
						<script>
						    function togglePassword() {
						        var passwordInput = document.getElementById("password");
						        var toggleButton = event.target;
						
						        if (passwordInput.type === "password") {
						            passwordInput.type = "text";
						            toggleButton.textContent = "Ocultar";
						        } else {
						            passwordInput.type = "password";
						            toggleButton.textContent = "Mostrar";
						        }
						    }
						</script>

						<!-- Nombre de usuario y Sexo -->
						<div class="col-md-6">
							<label for="nombreUsuario" class="form-label">Nombre de
								usuario</label> <input type="text" id="nombreUsuario"
								name="nombreUsuario" class="form-control" required
								value="<%= nombreUsuario %>">
						</div>
						<div class="col-md-6">
							<label for="sexo" class="form-label">Sexo</label> <select
								id="sexo" name="sexo" class="form-control">
								<option value="">Seleccione el sexo</option>
								<option value="Masculino" <%= sexoCliente.equals("Masculino") ? "selected" : "" %>>Masculino</option>
						        <option value="Femenino" <%= sexoCliente.equals("Femenino") ? "selected" : "" %>>Femenino</option>
							</select>
						</div>

						<!-- Nacionalidad y Fecha de nacimiento -->
						<div class="col-md-6">
						    <label for="nacionalidad" class="form-label">Nacionalidad</label>
						    <select name="nacionalidad" class="form-select" id="nacionalidad">
						        <option value="Argentino" <%= nacionalidadCliente.equals("Argentino") ? "selected" : "" %>>Argentino</option>
						        <option value="Boliviano" <%= nacionalidadCliente.equals("Boliviano") ? "selected" : "" %>>Boliviano</option>
						        <option value="Brasileño" <%= nacionalidadCliente.equals("Brasileño") ? "selected" : "" %>>Brasileño</option>
						        <option value="Chileno" <%= nacionalidadCliente.equals("Chileno") ? "selected" : "" %>>Chileno</option>
						        <option value="Colombiano" <%= nacionalidadCliente.equals("Colombiano") ? "selected" : "" %>>Colombiano</option>
						    </select>
						</div>
						<div class="col-md-6">
							<label for="fechaNacimiento" class="form-label">Fecha de
								Nacimiento</label> <input type="date" id="fechaNacimiento"
								name="fechaNacimiento" class="form-control" required value="<%= fechaNacimiento %>">
						</div>

						<!-- Provincia y Localidad -->
						<div class="col-md-6">
							<label for="provincia" class="form-label">Provincia</label> 
							
							<select
								id="provincia" name="provincia" class="form-control">
								<option value="">Seleccione la provincia</option>
								<%
									ArrayList<Provincia> listaProvincias = (ArrayList<Provincia>) request.getAttribute("listaProvincias");
									for (Provincia provincia : listaProvincias) {
										String selected = provincia.getNombre().equals(nombreProvincia) ? "selected" : "";
								%>
								    <option value="<%=provincia.getIdProvincia()%>" <%=selected%>><%=provincia.getNombre()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-md-6">
							<label for="localidad" class="form-label">Localidad</label> <select
								id="localidad" name="localidad" class="form-control">
								<option value="">Seleccione la localidad</option>
								<%
									ArrayList<Localidad> listaLocalidades = (ArrayList<Localidad>) request.getAttribute("listaLocalidades");
									for (Localidad localidad : listaLocalidades) {
						                String selected = localidad.getNombre().equals(nombreLocalidadCli) ? "selected" : "";
								%>
								<option value="<%=localidad.getIdLocalidad()%>" <%=selected%>><%=localidad.getNombre()%></option>
								<%
									}
								%>
							</select>
						</div>

						<!-- Código Postal, Calle, Número -->
						<div class="col-md-4">
							<label for="codigoPostal" class="form-label">Codigo
								Postal</label> <input type="text" id="codigoPostal" name="codigoPostal"
								class="form-control" required value="<%= codigoPostalDireccion %>">
						</div>
						<div class="col-md-4">
							<label for="calle" class="form-label">Calle</label> <input
								type="text" id="calle" name="calle" class="form-control"
								required value="<%= calleDireccion  %>">
						</div>
						<div class="col-md-4">
							<label for="numero" class="form-label">Numero</label> <input
								type="text" id="numero" name="numero" class="form-control"
								required value="<%= numeroDireccion  %>">
						</div>
												
					    <input type="hidden" name="IDUsuario" id="IDUsuario" value="<%= IDUsuario %>">
					    <input type="hidden" name="IdDireccion" id="IdDireccion" value=" <%= IdDireccion %>">
					
					</div>
					
					<!-- Botones de acción -->
					<div class="button-group mt-4">
						<button type="button" class="btn btn-secondary btn-volver"
							onclick="window.location.href='ListarClientesSv'">Volver</button>
						<button type="submit" class="btn-general btn-nuevo-cliente">Editar Cliente</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</body>
</html>