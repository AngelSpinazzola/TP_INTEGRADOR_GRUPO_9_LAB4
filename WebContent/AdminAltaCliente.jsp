<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Componentes/Head.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidad.Provincia"%>
<%@ page import="entidad.Localidad"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agregar Médico</title>
</head>

<body>

	<%@ include file="Componentes/NavbarAdmin.jsp"%>

	<br>
	<br>
	<div class="container">
		<h1>Agregar Cliente</h1>
		<form action="ServletAdmAlta" method="POST">
			<div class="form-group">
				<div class="form-field">
					<label for="dni">DNI</label> <input type="text" id="dni" name="dni"
						required>
				</div>

				<div class="form-field">
					<label for="name">Nombre</label> <input type="text" id="nombre"
						name="nombre" required>
				</div>

				<div class="form-field">
					<label for="surname">Apellido</label> <input type="text"
						id="apellido" name="apellido" required>
				</div>
			</div>

			<div class="form-group">
				<div class="form-field">
					<label for="birthdate">Fecha de nacimiento</label> <input
						type="date" id="fechaNacimiento" name="fechaNacimiento" required>
				</div>

				<div class="form-field">
					<label for="nacionalidad">Nacionalidad</label> <select name="nacionalidad"
						class="form-select">
						<option value="Argentino">Argentino</option>
						<option value="Uruguayo">Uruguayo</option>
						<option value="Chileno">Chileno</option>
						<option value="Brazilero">Brazilero</option>
						<option value="Peruano">Peruano</option>
						<option value="Otra nacionalidad">Otra nacionalidad..</option>
					</select>
				</div>

				<div class="form-field">
					<label for="sexo">Sexo</label> <select name="sexo"class="form-select">
						<option value="Masculino">Masculino</option>
						<option value="Femenino">Femenino</option>
						<option value="Otro">Otro</option>
					</select>
				</div>



			</div>

			<div class="form-group">

				<div class="form-group">
					<label for="provincia">Provincia</label> <select
						class="form-select">

						<%
							ArrayList<Provincia> lprovincia = (ArrayList<Provincia>) request.getAttribute("ListaProv");
							if (lprovincia != null)
								for (Provincia p : lprovincia) {
						%>
						<option value="<%=p.getIDProvincia()%>">
							<%=p.getNombre()%>
						</option>
						<%
							}
						%>

					</select>
				</div>

				<div class="form-group">
					<label for="localidad">Localidad</label> <select name="localidad"
						class="form-select">

						<%
							ArrayList<Localidad> llocalidad = (ArrayList<Localidad>) request.getAttribute("ListaLoc");
							if (llocalidad != null)
								for (Localidad l : llocalidad) {
						%>
						<option value="<%=l.getIDLocalidad()%>">
							<%=l.getNombre()%>
						</option>
						<%
							}
						%>


					</select>
				</div>


				<div class="form-field">
					<label for="email">Correo electrónico</label> <input type="email"
						id="email" name="email" required>
				</div>

			</div>


			<div class="form-group">

				<div class="form-field">
					<label for="username">Nombre de usuario</label> <input type="text"
						id="usuario" name="username" required>
				</div>


				<div class="form-field">
					<label for="password">Contraseña</label> <input type="password"
						id="contraseña" name="password" required>
				</div>

				<div class="form-field">
					<label for="repeat-password">Repetir contraseña</label> <input
						type="password" id="contraseña2" name="repeat-password" required>
				</div>

				<a href="AdminGestionClientes.jsp">
				<button type="button" class="button">Volver</button>				
				</a>
				<button type="submit" name="btnDarAlta" class="btn-customDarAlta">Dar de Alta</button>

			</div>
		</form>
	</div>

	<style>
/* Estilos basados en la imagen */
.btn-customDarAlta{
	   background-color: green;
       color: white;
       border: none;
       padding: 0.5rem 1rem;
       border-radius: 4px;
       cursor: pointer;
}
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 20px;
	margin-bottom: 15px;
}

.form-field {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input, select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.radio-group {
	display: flex;
	align-items: center;
	margin-top: 5px;
}

.radio-group label {
	margin-right: 10px;
}

button {
	   background-color: #0056b3;
       color: white;
       border: none;
       padding: 0.5rem 1rem;
       border-radius: 4px;
       cursor: pointer;
}

@media ( max-width : 600px) {
	.container {
		padding: 10px;
	}
}
</style>

</body>


