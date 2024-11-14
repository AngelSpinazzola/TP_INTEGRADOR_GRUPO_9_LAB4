<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banco UTN</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	max-width: 500px;
	margin: auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.form-control {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn {
	padding: 10px;
	width: 100%;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-GuardarCambios {
	background-color: #28a745;
	color: white;
}

.btn-DardeBaja {
	background-color: #dc3545;
	color: white;
}

.btn-Volver {
	background-color: #6c757d;
	color: white;
}
</style>
<%@ include file="Componentes/Head.jsp"%>
</head>
<body>
	<jsp:include page="Componentes/NavbarAdmin.jsp"></jsp:include>

	<div class="container">
		<h2>Editar Informacion del Cliente</h2>
		<form action="EditarClienteServlet" method="post">
			<label for="nombre">Nombre:</label> <input type="text" id="nombre"
				name="nombre" class="form-control" value="Juan"> <label
				for="apellido">Apellido:</label> <input type="text" id="apellido"
				name="apellido" class="form-control" value="Perez"> <label
				for="email">Email:</label> <input type="email" id="email"
				name="email" class="form-control" required> <label for="dni">DNI:</label>
			<input type="text" id="dni" name="dni" class="form-control"
				value="391239193221"> <label for="sexo">Sexo:</label> <select
				id="sexo" name="sexo" class="form-control">
				<option value="masculino" selected>Masculino</option>
				<option value="femenino">Femenino</option>
			</select> <label for="telefono">Teléfono:</label> <input type="text"
				id="telefono" name="telefono" class="form-control"
				value="1122331233"> <label for="provincia">Provincia:</label>
			<select id="provincia" name="provincia" class="form-control">
				<option value="buenosaires" selected>Buenos Aires</option>
				<option value="cordoba">Córdoba</option>
				<option value="santafe">Santa Fe</option>
				<!--Aca podemos Agrgar mas Opciones-->
			</select> <label for="localidad">Localidad:</label> <input type="text"
				id="localidad" name="localidad" class="form-control"
				value="San Martín"> <label for="direccion">Dirección:</label>
			<input type="text" id="direccion" name="direccion"
				class="form-control" value="Las Heras 2384">

			<button type="submit" name="accion" value="guardar"
				class="btn btn-GuardarCambios">Guardar cambios</button>
			<button type="submit" name="accion" value="eliminar"
				class="btn btn-DardeBaja">Dar de baja</button>
			<a href="volver.jsp" class="btn btn-Volver">Volver</a>
		</form>
	</div>

</body>
</html>