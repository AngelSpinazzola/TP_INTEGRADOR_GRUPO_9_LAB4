<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Componentes/Head.jsp"%>
<head>
</head>

<style>
<!--
-->
.section-title {
	font-size: 30px;
	color: #333;
	margin-top: 20px;
	text-align: center;
}

.button {
	background-color: #ddd;
	border: none;
	padding: 0.75rem 1.5rem;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1rem;
	margin-top: 1.5rem;
	width: 50%;
	margin: auto;
}

.button:hover {
	background-color: #ccc;
}

.btn-customDarAlta {
	background-color: var(- -primary-color);
	color: white;
	border: none;
	border-radius: 5px;
	padding: 0.75rem 1.5rem;
	font-size: 1rem;
	width: 50%;
	margin: auto;
}

.btn-customDarAlta:hover {
	background-color: var(- -secondary-color);
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 1.5rem;
}

.form-grid2 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 1.5rem;
	margin-top: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

input {
	padding: 0.10rem;
	border: 1px solid #ddd;
	border-radius: 4.0px;
	font-size: 1rem;
	margin-left: 20px;
	margin-right: 20px;
}

.form-select {
	padding: 0.10rem;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 1rem;
	margin-left: 20px;
	margin-right: 20px;
}

.form-control {
	padding: 0.10rem;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 1rem;
	margin-left: 20px;
	margin-right: 20px;
}

input:focus {
	outline: none;
	border-color: #26a69a;
	box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.1);
}

.container {
	max-width: 750px;
	margin: 2rem auto;
	padding: 0 1rem;
}
</style>

<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>
	<section class="section-fondo-altaCliente">

		<div class="section-title">Alta Cliente</div>
		<div class="container">
			<div class="card">
				<form action="procesar-datos.jsp" method="POST">
					<div class="form-grid">
						<div class="form-group">
							<label for="nombre">Nombre</label> <input type="text" id="nombre"
								name="nombre" required>
						</div>
						<div class="form-group">
							<label for="apellido">Apellido</label> <input type="text"
								id="apellido" name="apellido" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email" id="email"
								name="email" required>
						</div>
						<div class="form-group">
							<label for="dni">DNI</label> <input type="text" id="dni"
								name="dni" required>
						</div>
						<div class="form-group">
							<label for="usuario">Usuario</label> <input type="text"
								id="usuario" name="usuario" required>
						</div>
						<div class="form-group">
							<label for="contraseña">Contraseña</label> <input type="text"
								id="contraseña" name="contraseña" required>
						</div>

					</div>
					<!--  fin del primer grid -->

					<div class="form-grid2">

						<div class="form-group">
							<label for="sexo">Sexo</label> <select class="form-select">
								<option>Masculino</option>
								<option>Femenino</option>
								<option>Otro</option>
							</select>
						</div>
						<div class="form-group">
							<label for="nacionalidad">Nacionalidad</label> <select
								class="form-select">
								<option>Argentino</option>
								<option>Otra nacionalidad..</option>
							</select>
						</div>
						<div class="form-group">
							<label for="fechaNacimiento">Fecha de nacimiento</label> <input
								type="date" class="form-control" id="fechaNacimiento">
						</div>

					</div>
					<!--  fin del segundo grid -->

					<div class="form-grid">
						<div class="form-group">
							<label for="provincia">Provincia</label> <select
								class="form-select">
								<option>Buenos Aires</option>
								<option>Otra Provincia..</option>
							</select>
						</div>
						<div class="form-group">
							<label for="localidad">Localidad</label> <select
								class="form-select">
								<option>San Martin</option>
								<option>Otra Localidad..</option>
							</select>
						</div>

						<div class="form-group">
							<label for="direccion">Dirección</label> <input type="text"
								id="direccion" name="direccion" required>
						</div>
						<div class="form-group">
							<label for="telefono">Teléfono</label> <input type="tel"
								id="telefono" name="telefono" required>
						</div>

						<button type="submit" class="button">Volver</button>
						<button type="submit" class="btn btn-customDarAlta">Dar
							de Alta</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	
</body>
