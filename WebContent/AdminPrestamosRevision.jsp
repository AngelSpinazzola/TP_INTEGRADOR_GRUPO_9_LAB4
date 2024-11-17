<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es"><meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banco UTN - Solicitudes de préstamos</title>
	<style>
		* {
			box-sizing: border-box;
		}
		
		.navbar {
			background-color: #004b93;
			color: white;
			padding: 1rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.navbar-brand {
			font-size: 1.2rem;
			font-weight: bold;
		}
		
		.logout-btn {
			background-color: #39a9b3;
			color: white;
			border: none;
			padding: 0.5rem 1rem;
			border-radius: 4px;
			cursor: pointer;
		}
		
		.sidebar {
			width: 200px;
			background-color: #f5f5f5;
			height: calc(100vh - 56px);
			padding: 1rem;
			float: left;
		}
		
		.sidebar-item {
			padding: 0.5rem;
			margin-bottom: 0.5rem;
			cursor: pointer;
		}
		
		.sidebar-item.active {
			background-color: #cce5ff;
			border-radius: 4px;
		}
		
		.main-content {
			margin-left: 200px;
			padding: 2rem;
		}
		
		.page-title {
			color: #333;
			margin-bottom: 2rem;
		}
		
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 1rem;
		}
		
		th, td {
			padding: 0.75rem;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		
		.btn {
			padding: 0.25rem 0.75rem;
			border: none;
			border-radius: 4px;
			color: white;
			cursor: pointer;
			margin-right: 0.5rem;
		}
		
		.btn-success {
			background-color: #28a745;
		}
		
		.btn-danger {
			background-color: #dc3545;
		}
		
		.pagination {
			margin-top: 1rem;
			display: flex;
			gap: 0.5rem;
			align-items: center;
		}
		
		.pagination a {
			padding: 0.25rem 0.5rem;
			text-decoration: none;
			color: #004b93;
		}
		
		.pagination a.active {
			background-color: #004b93;
			color: white;
			border-radius: 4px;
		}
	</style>
	<%@ include file="Componentes/Head.jsp"%>
</head>
<body>

	<%@ include file="Componentes/NavbarAdmin.jsp"%>
	<div class="main-content">
		<h2 class="page-title">Solicitudes de préstamos</h2>
		<table>
			<thead>
				<tr>
					<th>Nombre y apellido</th>
					<th>DNI</th>
					<th>Monto solicitado</th>
					<th>Cuotas</th>
					<th>Concepto</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Armando Barreda</td>
					<td>38500015</td>
					<td>$50.000</td>
					<td>6</td>
					<td>Hipotecario</td>
					<td>
						<button class="btn btn-success">Aprobar</button>
						<button class="btn btn-danger">Rechazar</button>
					</td>
				</tr>
				<tr>
					<td>Bob Avrula</td>
					<td>88500015</td>
					<td>$95.000</td>
					<td>12</td>
					<td>Personal</td>
					<td>
						<button class="btn btn-success">Aprobar</button>
						<button class="btn btn-danger">Rechazar</button>
					</td>
				</tr>
				<tr>
					<td>Leo Pondo</td>
					<td>12413344</td>
					<td>$50.000</td>
					<td>6</td>
					<td>Hipotecario</td>
					<td>
						<button class="btn btn-success">Aprobar</button>
						<button class="btn btn-danger">Rechazar</button>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="pagination">
			<span>Mostrando página 1 de 2</span> <a href="#" class="active">1</a>
			<a href="#">2</a> <a href="#">3</a> <a href="#">Siguiente</a>
		</div>
	</div>
</body>
</html>