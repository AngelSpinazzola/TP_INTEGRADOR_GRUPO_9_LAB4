<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="entidad.Prestamo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Mis Préstamos</title>
    <style>
		.pagination-container {
			display: flex;
			justify-content: space-around;
			align-items: center; 
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
		
		.pagination-info {
			font-size: 16px;
			color: #333;
		}
		
		
		.btn-mov {
           background-color: var(--primary-color);
           color: white;
           border: none;
           margin-top: 10px;
           padding: 10px 20px;
           border-radius: 4px;
           cursor: pointer;
           font-size: 14px;
           width: 200px;
       }

       .btn-mov:hover {
           background-color: var(--secondary-color);
       }

       .btn-volver:hover {
           background-color: #d0d0d0;
       }
		
		.container {
			max-width: 1000px;
			margin: 30px auto;
		}
		
		.section-title {
			font-size: 24px;
			color: #333;
			margin-top: 20px;
			text-align: center;
		}
		
		.section-content {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			width: 100%;
			margin-top: 10px;
		}
		
		.account-cards {
			display: flex;
			gap: 20px;
			justify-content: center;
			margin-top: 20px;
		}
		
		.form-select {
			width: 300px;
			padding: 8px;
			/* Añadido para que el select sea más alto y mejor alineado */
			font-size: 14px;
			margin-top: 5px;
			/* Un pequeño margen para separar el texto y el select */
		}
		
		.account-card {
			border: 1px solid #d1d1d1;
			border-radius: 20px;
			padding: 20px;
			width: 382px;
			text-align: left;
			background-color: #fff;
		}
		
		.account-card h3 {
			margin: 0;
			font-size: 18px;
			color: #333;
		}
		
		.account-card p {
			margin: 5px 0;
			font-size: 14px;
		}
		
		.account-card button {
			background-color: #0066cc;
			color: white;
			border: none;
			padding: 5px 10px;
			border-radius: 5px;
			cursor: pointer;
		}
		
		.transactions-table {
			width: 80%;
			margin: 20px auto;
			background-color: #fff;
			border-collapse: collapse;
			border-radius: 5px;
			overflow: hidden;
		}
		
		.transactions-table th, .transactions-table td {
			padding: 10px;
			text-align: center;
			border: 1px solid #ddd;
		}
		
		.transactions-table th {
			background-color: #e0e0e0;
			font-size: 16px;
		}
		
		.transactions-table .negative {
			color: red;
		}
		
		.transactions-table .positive {
			color: green;
		}
		
		.pagination {
			display: flex;
			justify-content: space-evenly;
			gap: 10px;
		}
		
		.pagination a {
			padding: 8px 16px;
			border: 1px solid #ddd;
			border-radius: 5px;
			text-decoration: none;
			color: #333;
		}
		
		.pagination a:hover {
			background-color: #0066cc;
			color: white;
		}
		
		.pagination a.active {
			background-color: #0066cc;
			color: white;
		}
        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        h1 {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            color: #333;
        }

        .tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .tab-button {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            background-color: #e0e0e0;
        }

        .tab-button.active {
            background-color: #26a69a;
            color: white;
        }

        .loans-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        .loans-table th,
        .loans-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .loans-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #333;
        }

        .status {
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-approved {
            background-color: #e8f5e9;
            color: #2e7d32;
        }

        .status-pending {
            background-color: #fff3e0;
            color: #f57c00;
        }

        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
        }

        .pagination-info {
            color: #666;
        }

        .pagination-controls {
            display: flex;
            gap: 0.5rem;
        }

        .pagination-button {
            padding: 0.5rem 1rem;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
            border-radius: 4px;
        }

        .pagination-button.active {
            background-color: #1976d2;
            color: white;
            border-color: #1976d2;
        }

        .pagination-button:hover:not(.active) {
            background-color: #f5f5f5;
        }

        .pagination-button:disabled {
            background-color: #f5f5f5;
            cursor: not-allowed;
            color: #999;
        }
    </style>
</head>
<body>
     <%@ include file="Componentes/Head.jsp"%>
   <jsp:include page="Componentes/Navbar.jsp"></jsp:include>
<%
ArrayList<Cuenta> listaCuenta = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
if (listaCuenta == null) {
    out.println("<p style='color:red;'>Error: listaCuentas es null</p>");
} else if (listaCuenta.isEmpty()) {
    out.println("<p style='color:orange;'>Aviso: listaCuentas está vacía</p>");
}
%>
<%
    // Obtener los mensajes de la sesión
    String mensajeExito = (String) session.getAttribute("success");
    String mensajeError = (String) session.getAttribute("error");

    // Eliminar los mensajes de la sesión para que no se repitan
    session.removeAttribute("success");
    session.removeAttribute("error");
    
    
	%>
	
	<% if (mensajeExito != null) { %>
	
    <div style="color: green; font-weight: bold; background-color: #d4edda; padding: 10px; border-radius: 5px; text-align: center; display: flex; justify-content: center; ">
        <%= mensajeExito %>
    </div>
	<% } %>
	
	<% if (mensajeError != null) { %>
	    <div style="color: red; font-weight: bold; background-color: #f8d7da; padding: 10px; border-radius: 5px; text-align: center; display: flex; justify-content: center;">
	        <%= mensajeError %>
	    </div>
<% } %>
	
			<%
			HttpSession MiSession = request.getSession(false);
			
			Cliente usuario = new Cliente();
			
			if (MiSession != null) {
	            // Obtener el objeto Cliente de la sesión
				usuario = (Cliente) MiSession.getAttribute("usuario");
	            if (usuario != null) {
	            } else {
	            	System.out.println("No hay usuario en la sesión.");
	            }
	        } else {
            	System.out.println("No hay sesión activa.");
	        }
			
		    int dniCliente = usuario.getDni();
			%>


	<div class="container">
		<h1>Gestión de Préstamos</h1>
            
        <div class="tabs">
			<a href="PrestamosSV?dni<%=dniCliente%>" class="tab-button active">Mis préstamos</a>
			<a href="CargarDesplegablesSv?dni=<%= dniCliente %>&action=getMisPrestamos" class="tab-button">Solicitar Prestamo</a>
	    	<a href="PagarCuotas.jsp" class="tab-button">Pagar cuotas</a>
		</div>
		
		<div class="section-title">Últimos Prestamos</div>
		<table class="transactions-table">
			<thead>
	            <tr>
	                <th>ID Prestamo</th>
	                <th>ID Cuenta</th>
	                <th>Monto Pedido</th>
	                <th>Total a pagar</th>
	                <th>Cuotas</th>
	                <th>Fecha</th>
	                <th>Estado</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%
	                ArrayList<Prestamo> prestamos = (ArrayList<Prestamo>) request.getAttribute("listaPrestamos");
	                if (prestamos != null && !prestamos.isEmpty()) {
	                    for (Prestamo pres : prestamos) {
		        %>
		                    <tr>
		                        <td><%= pres.getIdPrestamo() %></td>
		                        <td><%= pres.getIdCuenta() %></td>
		                        <td><%= pres.getMontoPedido() %></td>
		                        <td><%= pres.getMontoAPagar() %></td>
		                        <td><%= pres.getCuotas() %></td>
		                        <td><%= pres.getFecha() %></td>
		                        <td><%= pres.getEstado() %></td>
		                    </tr>
		        <%
	                    }
	                } else {
	            %>
	                    <tr><td colspan="3">No hay Prestamos hechos</td></tr>
	            <%
	                }
	            %>
	        </tbody>
		</table>

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
				    Integer totalPagesAttr = (Integer) request.getAttribute("totalPages");
				    Integer currentPageAttr = (Integer) request.getAttribute("currentPage");
	
				    int totalPages = (totalPagesAttr != null) ? totalPagesAttr : 1; // Si es null, poner 1 por defecto
				    int currentPage = (currentPageAttr != null) ? currentPageAttr : 1;
				    
					for (int i = 1; i <= totalPages; i++) {
						String activeClass = (i == currentPage) ? "active" : "";
				%>
				    
				<%
			    Integer idCuenta = (Integer) request.getAttribute("idCuenta"); 
				%>    
				
				<button class="<%=activeClass%>"
					onclick="window.location.href='ClienteMovimientos?page=<%=i%>&pageSize=5&idCuenta=<%=idCuenta%>'">
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