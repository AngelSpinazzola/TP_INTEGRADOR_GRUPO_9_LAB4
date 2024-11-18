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
</head>

<body>
	<!-- Menú de Navegación -->
	<%@ include file="Componentes/NavbarAdmin.jsp"%>
	<!-- Contenedor principal para del formulario -->
	<div class="d-flex justify-content-center align-items-center vh-100">
		<div class="p-4 border rounded shadow-lg bg-white"
			style="max-width: 800px; width: 100%;">
			<h2 class="add-title text-center">Agregar Nuevo Cliente</h2>
			<form action="AltaClienteSv" method="post">
				<div class="row g-3">
					<!-- Nombre de usuario -->
					<div class="col-md-6">
						<label for="nombreUsuario" class="form-label">Nombre de
							usuario</label> <input type="text" id="nombreUsuario"
							name="nombreUsuario" class="form-control" required
							placeholder="Nombre de usuario">
					</div>

					<!-- Email -->
					<div class="col-md-6">
						<label for="email" class="form-label">Email</label> <input
							type="email" id="email" name="email" class="form-control"
							required placeholder="Email">
					</div>

					<!-- Contraseña -->
					<div class="col-md-6">
						<label for="password" class="form-label">Contraseña</label> <input
							type="password" id="password" name="password"
							class="form-control" required placeholder="Contraseña">
					</div>

					<!-- Nombre -->
					<div class="col-md-6">
						<label for="nombre" class="form-label">Nombre</label> <input
							type="text" id="nombre" name="nombre" class="form-control"
							required placeholder="Ingrese el nombre del cliente">
					</div>

					<!-- Apellido -->
					<div class="col-md-6">
						<label for="apellido" class="form-label">Apellido</label> <input
							type="text" id="apellido" name="apellido" class="form-control"
							required placeholder="Ingrese el apellido del cliente">
					</div>

					<!-- DNI -->
					<div class="col-md-6">
						<label for="dni" class="form-label">DNI</label> <input type="text"
							id="dni" name="dni" class="form-control" required
							placeholder="Ingrese el DNI">
					</div>

					<!-- CUIL -->
					<div class="col-md-6">
						<label for="cuil" class="form-label">Cuil</label> <input
							type="text" id="cuil" name="cuil" class="form-control" required
							placeholder="Ingrese el Cuil">
					</div>

					<!-- Sexo -->
					<div class="col-md-6">
						<label for="sexo" class="form-label">Sexo</label> <select
							id="sexo" name="sexo" class="form-control">
							<option value="">Seleccione el sexo</option>
							<option value="M">Masculino</option>
							<option value="F">Femenino</option>
						</select>
					</div>

					<!-- Nacionalidad -->
					<div class="col-md-6">
						<label for="nacionalidad" class="form-label">Nacionalidad</label>
						<select name="nacionalidad" class="form-select" id="nacionalidad">
							<option value="Argentino">Argentino</option>
							<option value="Boliviano">Boliviano</option>
							<option value="Brasileño">Brasileño</option>
							<option value="Chileno">Chileno</option>
							<option value="Colombiano">Colombiano</option>
							<!-- Más opciones aquí -->
						</select>
					</div>

					<!-- Fecha de Nacimiento -->
					<div class="col-md-6">
						<label for="fechaNacimiento" class="form-label">Fecha de
							Nacimiento</label> <input type="date" id="fechaNacimiento" required
							name="fechaNacimiento" class="form-control">
					</div>

					<!-- Provincia -->
					<div class="col-md-6">
						<label for="provincia" class="form-label">Provincia</label> <select
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

					<!-- Localidad -->
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

					<!-- Código Postal -->
					<div class="col-md-6">
						<label for="codigoPostal" class="form-label">Código Postal</label>
						<input type="text" id="codigoPostal" name="codigoPostal"
							class="form-control" required placeholder="Código Postal">
					</div>

					<!-- Calle -->
					<div class="col-md-6">
						<label for="calle" class="form-label">Calle</label> <input
							type="text" id="calle" name="calle" class="form-control" required
							placeholder="Calle">
					</div>

					<!-- Número -->
					<div class="col-md-6">
						<label for="numero" class="form-label">Número</label> <input
							type="text" id="numero" name="numero" class="form-control"
							required placeholder="Número">
					</div>
				</div>

				<!-- Botones -->
				<div class="mt-4 text-center">
					<button type="submit" class="btn btn-primary">Guardar
						Cliente</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>


