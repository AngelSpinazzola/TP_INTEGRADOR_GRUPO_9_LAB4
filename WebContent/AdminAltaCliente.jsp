<%@ page import="java.util.ArrayList"%>
<%@ page import="entidad.Provincia"%>
<%@ page import="entidad.Localidad"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agregar cliente</title>
<%@ include file="Componentes/Head.jsp"%>
<style>
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
</head>

<body>
	<!-- Menú de Navegación -->
	<%@ include file="Componentes/NavbarAdmin.jsp"%>

	<div class="container">
		<!-- Contenedor principal del formulario -->
		<h3 class="form-title">Agregar nuevo cliente</h3>
		<div class="d-flex justify-content-center align-items-center vh-100">
			<div class="p-4 border rounded shadow-lg bg-white form-container">
				<form action="AltaClienteSv" method="post">
					<div class="row g-3">
						<!-- Nombre y Apellido -->
						<div class="col-md-6">
							<label for="nombre" class="form-label">Nombre</label> <input
								type="text" id="nombre" name="nombre" class="form-control"
								required placeholder="Ingrese el nombre del cliente">
						</div>
						<div class="col-md-6">
							<label for="apellido" class="form-label">Apellido</label> <input
								type="text" id="apellido" name="apellido" class="form-control"
								required placeholder="Ingrese el apellido del cliente">
						</div>

						<!-- DNI y CUIL -->
						<div class="col-md-6">
							<label for="dni" class="form-label">DNI</label> <input
								type="text" id="dni" name="dni" class="form-control" required
								placeholder="Ingrese el DNI">
						</div>
						<div class="col-md-6">
							<label for="cuil" class="form-label">Cuil</label> <input
								type="text" id="cuil" name="cuil" class="form-control" required
								placeholder="Ingrese el Cuil">
						</div>

						<!-- Email y Contraseña -->
						<div class="col-md-6">
							<label for="email" class="form-label">Email</label> <input
								type="email" id="email" name="email" class="form-control"
								required placeholder="Email">
						</div>
						<div class="col-md-6">
							<label for="password" class="form-label">Contraseña</label> <input
								type="password" id="password" name="password"
								class="form-control" required placeholder="Contraseña">
						</div>

						<!-- Nombre de usuario y Sexo -->
						<div class="col-md-6">
							<label for="nombreUsuario" class="form-label">Nombre de
								usuario</label> <input type="text" id="nombreUsuario"
								name="nombreUsuario" class="form-control" required
								placeholder="Nombre de usuario">
						</div>
						<div class="col-md-6">
							<label for="sexo" class="form-label">Sexo</label> <select
								id="sexo" name="sexo" class="form-control">
								<option value="">Seleccione el sexo</option>
								<option value="M">Masculino</option>
								<option value="F">Femenino</option>
							</select>
						</div>

						<!-- Nacionalidad y Fecha de nacimiento -->
						<div class="col-md-6">
							<label for="nacionalidad" class="form-label">Nacionalidad</label>
							<select name="nacionalidad" class="form-select" id="nacionalidad">
								<option value="Argentino">Argentino</option>
								<option value="Boliviano">Boliviano</option>
								<option value="Brasileño">Brasileño</option>
								<option value="Chileno">Chileno</option>
								<option value="Colombiano">Colombiano</option>
							</select>
						</div>
						<div class="col-md-6">
							<label for="fechaNacimiento" class="form-label">Fecha de
								Nacimiento</label> <input type="date" id="fechaNacimiento"
								name="fechaNacimiento" class="form-control" required>
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
								%>
								<option value="<%=provincia.getIdProvincia()%>"><%=provincia.getNombre()%></option>
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
								%>
								<option value="<%=localidad.getIdLocalidad()%>"><%=localidad.getNombre()%></option>
								<%
									}
								%>
							</select>
						</div>

						<!-- Código Postal, Calle, Número -->
						<div class="col-md-4">
							<label for="codigoPostal" class="form-label">Código
								Postal</label> <input type="text" id="codigoPostal" name="codigoPostal"
								class="form-control" required placeholder="Código Postal">
						</div>
						<div class="col-md-4">
							<label for="calle" class="form-label">Calle</label> <input
								type="text" id="calle" name="calle" class="form-control"
								required placeholder="Calle">
						</div>
						<div class="col-md-4">
							<label for="numero" class="form-label">Número</label> <input
								type="text" id="numero" name="numero" class="form-control"
								required placeholder="Número">
						</div>
					</div>
					
					<!-- Botones de acción -->
					<div class="button-group mt-4">
						<button type="button" class="btn btn-secondary btn-volver"
							onclick="window.location.href='ListarClientesSv'">Volver</button>
						<button type="submit" class="btn-general btn-nuevo-cliente">Dar
							alta</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


