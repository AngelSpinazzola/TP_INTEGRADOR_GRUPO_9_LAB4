<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="entidad.Movimientos"%>
<%@ page import="entidad.Cliente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Banco UTN - Movimientos</title>
<%@ include file="Componentes/Head.jsp"%>
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
	</style>
</head>
<body>
	<%@ include file="Componentes/Navbar.jsp"%>

	<div class="container">
		<form action="ClienteMovimientos?param=1" method="get">
			<div class="section-content">
				<h4>Mi cuenta</h4>
				<select id="idCuenta" name="idCuenta" class="form-select">
	                   <option value="0">Seleccione una cuenta</option>
	                   <%
					ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
					if (listaCuentas != null) {
					    for (Cuenta cuenta : listaCuentas) {
					%>
					    <option value="<%=cuenta.getIdCuenta()%>">
					        <%=cuenta.getCbu()%>
					    </option>
					<%
					    }
					} else {
					%>
					    <option value="">No hay cuentas disponibles</option>
					<%
					}
					%>
	               </select>
	               <input type="submit" value="Ver Movimientos" class="btn-mov">
			</div>
		</form>

		<div class="section-title">Últimos movimientos</div>
		<table class="transactions-table">
			<thead>
	            <tr>
	                <th>Fecha</th>
	                <th>Detalle</th>
	                <th>Importe</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%
	                ArrayList<Movimientos> movimientos = (ArrayList<Movimientos>) request.getAttribute("listaMovimientos");
	                if (movimientos != null && !movimientos.isEmpty()) {
	                    for (Movimientos mov : movimientos) {
			            String color = (mov.getImporte() < 0) ? "red" : "green";
		        %>
		                    <tr>
		                        <td><%= mov.getFecha() %></td>
		                        <td><%= mov.getDetalle() %></td>
		                        <td style="color: <%= color %>; ">
		                            <%= mov.getImporte() %>
		                        </td>
		                    </tr>
		        <%
	                    }
	                } else {
	            %>
	                    <tr><td colspan="3">No hay movimientos</td></tr>
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
