<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Banco UTN</title>

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
	
				<button id="boton" type="submit" name="accion" value="guardar"
					class="btn-GuardarCambios">Guardar cambios</button>
				<button id="boton" type="submit" name="accion" value="eliminar"
					class="btn-DardeBaja">Dar de baja</button>
			</form>
		</div>
	
	</body>
</html>