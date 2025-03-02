<%@page import="entidad.Prestamo"%>
<%@page import="entidad.Cliente"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Pr�stamos Activos</title>
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

        .menu-item {
            padding: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            color: #333;
            text-decoration: none;
        }

        .submenu {
            margin-left: 1rem;
        }

        .submenu .menu-item {
            padding: 0.5rem 0.75rem;
        }

        .menu-item.active {
            background-color: #1a4f7c;
            color: white;
            border-radius: 4px;
        }

        .main-content {
            margin-left: 200px;
            padding: 2rem;
        }

        .page-title {
            color: #333;
            margin-bottom: 2rem;
            font-size: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
            background-color: white;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            font-weight: 600;
            color: #333;
        }

        .pagination {
            margin-top: 1rem;
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.9rem;
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

        .prestamos-dropdown {
            background-color: #1a4f7c;
            color: white;
            padding: 0.75rem;
            border-radius: 4px;
            margin-bottom: 0.5rem;
        }
    </style>
	<%@ include file="Componentes/Head.jsp"%>
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
 %>
    <div class="main-content">
        <h2 class="page-title">Pr�stamos activos</h2>
       <%
				if (prestamos != null && !prestamos.isEmpty()) {
			%>
			<table>
				<thead>
					<tr>
						<th>Nombre y Apelldio</th>
						<th>ID</th>
						<th>Tipo de pr�stamo</th>
						<th>Monto pedido</th>
						<th>Monto a pagar</th>
						<th>Cuotas</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Prestamo prestamo : prestamos ) {
					%>
					<tr>
						<td><%=cliente.getNombre() + " " + cliente.getApellido()%></td>
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

			<!-- Paginaci�n -->
			<div class="pagination-container">
				<%
					int totalPrestamos = (Integer) request.getAttribute("totalPrestamos");
						if (totalPrestamos > 3) {
				%>
				<div class="pagination-info">
					Mostrando p�gina
					<%=request.getAttribute("currentPage")%>
					de
					<%=request.getAttribute("totalPages")%>
				</div>
				<div class="pagination">
					<%
						int totalPaginas = (Integer) request.getAttribute("totalPages");
								int paginaActual = (Integer) request.getAttribute("currentPage");
				
								for (int i = 1; i <= totalPaginas; i++) {
									String activeClass = (i == paginaActual) ? "active" : "";
					%>
					<button class="<%=activeClass%>"
						onclick="window.location.href='ListarPrestamosSV?page=<%=i%>&pageSize=3'">
						<%=i%>
					</button>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
			<%
				} else {
			%>
			<p>No se encontraron pr�stamos pendientes.</p>
			<%
				}
			%>
		</div>
</body>
</html>