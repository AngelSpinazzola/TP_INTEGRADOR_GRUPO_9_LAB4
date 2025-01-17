<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="entidad.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
.container {
	max-width: 1000px;
	margin: 30px auto;
	padding: 20px;
}

.client-table-container {
	border: 1px solid #ddd;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-top: 30px;
}

h2 {
	margin-bottom: 30px;
}

.client-table {
	width: 100%;
	border-collapse: collapse;
}

.client-table th, .client-table td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.action-buttons {
	position: relative;
}

.action-buttons button {
	background-color: transparent;
	border: none;
	cursor: pointer;
}

.action-dropdown {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.action-dropdown a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.action-dropdown a:hover {
	background-color: #ddd;
}

.action-buttons:hover .action-dropdown {
	display: block;
}

.pagination-container {
	display: flex;
	justify-content: space-between;
	align-items: center; 
	margin-top: 20px;
}
.pagination {
	display: flex;
	justify-content: flex-end; 
}

.pagination button {
	background-color: #aac4ee;
	border: none;
	color: white;
	padding: 8px 16px;
	text-decoration: none;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 2px;
}

.pagination button:hover {
	background-color: #2F4E93;
	color: white;
}

.pagination button.active {
	text-color: white;
	background-color: #2F4E93;
	color: white;
}

.btn-nuevo-cliente-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

.pagination-info {
	font-size: 16px;
	color: #333;
}

.btn-nuevo-cliente {
	width: 200px;
}
</style>
<%@ include file="Componentes/Head.jsp"%>
</head>
<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>



	<div class="container">
		<h2>Gestión de Clientes</h2>
		<div class="btn-nuevo-cliente-container">
			<a href="CargarDesplegablesSv?action=agregarCliente">
				<button class="btn-general btn-nuevo-cliente">Nuevo Cliente</button>
			</a>
		</div>
		<div class="client-table-container">
			<table class="client-table">
				<thead>
					<tr>
						<th>DNI</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Cuentas</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes");
						Iterator<Cliente> iteradorClientes = listaClientes.iterator();

						while (iteradorClientes.hasNext()) {
							Cliente cliente = iteradorClientes.next();
					%>
					<tr>
						<td><%=cliente.getIDUsuario()%></td>
						<td><%=cliente.getDni()%></td>
						<td><%=cliente.getNombre()%></td>
						<td><%=cliente.getApellido()%></td>
						<td><%=cliente.getCantidadCuentas()%></td>
						<td><%=cliente.getEstado()%></td>
						
						<td>
							<div class="action-buttons">
								<button>
									<i class="fas fa-ellipsis-v"></i>
								</button>
								<div class="action-dropdown">
									<a href="DetalleClienteSv?dni=<%= cliente.getDni() %>">Ver Cliente</a>
									<a href="AdminEditarCliente.jsp">Editar Cliente</a> 
									<a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
								</div>
							</div>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<!-- Paginación -->
		<div class="pagination-container">
			<div class="pagination-info">
				Mostrando página
				<%=request.getAttribute("currentPage")%>
				de
				<%=request.getAttribute("totalPages")%>
			</div>

			<!-- Botones de paginación -->
			<div class="pagination">
				<%
					int totalPages = (Integer) request.getAttribute("totalPages");
					int currentPage = (Integer) request.getAttribute("currentPage");

					for (int i = 1; i <= totalPages; i++) {
						String activeClass = (i == currentPage) ? "active" : "";
				%>
				<button class="<%=activeClass%>"
					onclick="window.location.href='ListarClientesSv?page=<%=i%>&pageSize=5'">
					<%=i%>
				</button>
				<%
					}	
				%>
			</div>
		</div>


	</div>
</body>
</html>