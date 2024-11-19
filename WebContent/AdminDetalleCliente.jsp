<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="entidad.Prestamo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="Componentes/Head.jsp"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banco UTN - Detalles de Cliente</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

/* Header styles */
.header {
	background-color: #003b7a;
	color: white;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header h1 {
	margin: 0;
	font-size: 24px;
}

.logout-btn {
	background-color: #2b937b;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
}

/* Container styles */
.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 0 20px;
}

.page-title {
	font-size: 24px;
	margin-bottom: 20px;
}

/* Card styles */
.card {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	padding: 20px;
}

.card-title {
	font-size: 18px;
	margin-bottom: 15px;
	color: #333;
}

/* Personal info styles */
.info-grid {
	display: grid;
	grid-template-columns: auto 1fr;
	gap: 10px;
	line-height: 1.6;
}

.info-label {
	font-weight: bold;
	color: #666;
}

/* Account table styles */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	color: #666;
	font-weight: bold;
}

.balance {
	color: #28a745;
}

/* Status badges */
.status {
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 14px;
}

.pending {
	background-color: #ffd700;
}

.rejected {
	background-color: #dc3545;
	color: white;
}

.approved {
	background-color: #28a745;
	color: white;
}

/* Pagination */
.pagination {
	display: flex;
	justify-content: flex-end;
	gap: 5px;
	margin-top: 15px;
}

.pagination button {
	padding: 5px 10px;
	border: 1px solid #ddd;
	background: white;
	cursor: pointer;
}

.pagination button.active {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}

@media ( max-width : 768px) {
	.info-grid {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>

	<%
		Cliente cliente = (Cliente) request.getAttribute("cliente");

		if (cliente == null) {
			out.print("Cliente no encontrado.");
			return;
		}
		ArrayList<Prestamo> prestamos = (ArrayList<Prestamo>) request.getAttribute("prestamos");
		ArrayList<Cuenta> cuentas = (ArrayList<Cuenta>) request.getAttribute("cuentas");
	%>
	
	<div class="container">
	
		<!-- Detalles del cliente -->		
		<h2 class="page-title">Detalles de Cliente</h2>
		<div class="card">
			<h3 class="card-title">Información personal</h3>
			<div class="info-grid">
				<span class="info-label">Usuario:</span> <span><%=cliente.getNombreUsuario()%></span>
				<span class="info-label">Nombre y apellido:</span> <span><%=cliente.getNombre() + " " + cliente.getApellido()%></span>
				<span class="info-label">Email:</span> <span><%=cliente.getEmail()%></span>
				<span class="info-label">DNI:</span> <span><%=cliente.getDni()%></span>
				<span class="info-label">Estado:</span> <span><%=cliente.getEstado() == 1 ? "Activo" : "Inactivo"%></span>
				<span class="info-label">Teléfono:</span> <span> <%=cliente.getTelefono() != null ? cliente.getTelefono() : "Sin teléfono"%>
				</span> <span class="info-label">Dirección:</span> <span>Las heras
					341</span>
			</div>
		</div>

		<!-- Resumen de cuentas -->
		<div class="card">
			<h3 class="card-title">Resumen de cuentas</h3>
			<%
				if (cuentas != null && !cuentas.isEmpty()) {
			%>
			<table>
				<thead>
					<tr>
						<th>Número de cuenta</th>
						<th>CBU</th>
						<th>Fecha de creación</th>
						<th>Tipo de cuenta</th>
						<th>Saldo</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Cuenta cuenta : cuentas) {
					%>
					<tr>
						<td><%=cuenta.getNumeroCuenta()%></td>
						<td><%=cuenta.getCbu()%></td>
						<td><%=cuenta.getFechaCreacion()%></td>
						<td><%=cuenta.getTipoCuenta().getTipo()%></td>
						<td class="balance">$<%=cuenta.getSaldo()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				} else {
			%>
			<p>No se encontraron cuentas para este cliente.</p>
			<%
				}
			%>
		</div>

		<!-- Resumen de préstamos -->
		<div class="card">
			<h3 class="card-title">Resumen de préstamos</h3>

			<%
				if (prestamos != null && !prestamos.isEmpty()) {
			%>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Tipo de préstamo</th>
						<th>Monto pedido</th>
						<th>Monto a pagar</th>
						<th>Cuotas</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Prestamo prestamo : prestamos) {
					%>
					<tr>
						<td><%=prestamo.getIdPrestamo()%></td>
						<td><%=prestamo.getNombreTipoPrestamo()%></td>
						<td><%=prestamo.getMontoPedido()%></td>
						<td><%=prestamo.getMontoAPagar()%></td>
						<td><%=prestamo.getCuotas()%></td>
						<td>
							<%
								int estadoInt = prestamo.getEstado();
										String estado = "";
										String claseEstado = "";

										if (estadoInt == 0) {
											estado = "Pendiente";
											claseEstado = "pending";
										} else if (estadoInt == 1) {
											estado = "Aprobado";
											claseEstado = "approved";
										} else if (estadoInt == 2) {
											estado = "Rechazado";
											claseEstado = "rejected";
										}
							%> <span class="status <%=claseEstado%>"><%=estado%></span>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				} else {
			%>
			<p>No se encontraron préstamos para el cliente.</p>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>