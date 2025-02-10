<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Usuario"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="entidad.Prestamo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Información Personal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: bold;
        }

        input {
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        input:focus {
            outline: none;
            border-color: #26a69a;
            box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.1);
        }

        .button {
            background-color: #ddd;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 1.5rem;
            width: 100%;
        }

        .button:hover {
            background-color: #ccc;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    
    <%@ include file="Componentes/Head.jsp"%>
   <jsp:include page="Componentes/Navbar.jsp"></jsp:include>
   

<style>
	body {
		margin: 0;
		padding: 0;
		background-color: #f5f5f5;
	}
	
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
	
	.container {
		max-width: 1200px;
		margin: 20px auto;
		padding: 0 20px;
	}
	
	.page-title {
		font-size: 24px;
		margin-bottom: 20px;
	}
	.card {
		background-color: white;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		margin-bottom: 20px;
		padding: 20px;
	}
	.card-title, .info-section-title {
		font-family: Arial, sans-serif;
		color: #333; 
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 15px; 
		border-bottom: 2px solid #e0e0e0;
		padding-bottom: 5px;
	}
	.info-grid {
		display: flex;
		flex-direction: column;
		gap: 15px;
	}
	.info-row {
		display: grid;
		grid-template-columns: 200px 1fr;
		gap: 10px;
		align-items: center;
	}
	
	.info-grid.two-columns {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 20px;
	}
	
	.info-column {
		width: 100%;
	}
	
	.info-section {
		background-color: transparent;
		padding: 15px;
		border-radius: 6px;
	}
	.info-label {
		font-weight: bold;
		color: #666;
		text-align: left;
	}
	.info-row span {
		text-align: left;
	}
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
	
	.pagination-info {
		font-size: 16px;
		color: #333;
	}
</style>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
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
			<div class="info-grid two-columns">
				<div class="info-column">
					<div class="info-section">
						<h3 class="info-section-title">Información personal</h3>
						<div class="info-row">
							<span class="info-label">Usuario:</span> <span><%=cliente.getUsuario().getNombreUsuario()%></span>
						</div>
						<div class="info-row">
							<span class="info-label">Nombre y apellido:</span> <span><%=cliente.getNombre() + " " + cliente.getApellido()%></span>
						</div>
						<div class="info-row">
							<span class="info-label">Email:</span> <span><%=cliente.getEmail()%></span>
						</div>
						<div class="info-row">
							<span class="info-label">DNI:</span> <span><%=cliente.getDni()%></span>
						</div>
						<div class="info-row">
							<span class="info-label">Cuil:</span> <span><%=cliente.getCuil()%></span>
						</div>
						<div class="info-row">
							<span class="info-label">Estado:</span> <span><%=cliente.getEstado() == 1 ? "Activo" : "Inactivo"%></span>
						</div>
						<div class="info-row">
							<span class="info-label">Teléfono:</span> <span><%=cliente.getNumeroTelefono() != null ? cliente.getNumeroTelefono() : "Sin teléfono"%></span>
						</div>
					</div>
				</div>

				<div class="info-column">
					<div class="info-section">
						<h3 class="info-section-title">Dirección</h3>
						
						
						<c:forEach>
						</c:forEach>
						
						
						<div class="info-row">
							<span class="info-label">Provincia:</span> <span> <%=cliente.getDireccion() != null && cliente.getDireccion().getProvincia() != null
					? cliente.getDireccion().getProvincia().getNombre()
					: "Sin provincia"%>
							</span>
						</div>
						<div class="info-row">
							<span class="info-label">Localidad:</span> <span> <%=cliente.getDireccion() != null && cliente.getDireccion().getLocalidad() != null
					? cliente.getDireccion().getLocalidad().getNombre()
					: "Sin localidad"%>
							</span>
						</div>
						<div class="info-row">
							<span class="info-label">Código Postal:</span> <span> <%=cliente.getDireccion() != null ? cliente.getDireccion().getCodigoPostal() : "Sin código postal"%>
							</span>
						</div>
						<div class="info-row">
							<span class="info-label">Calle:</span> <span> <%=cliente.getDireccion() != null && cliente.getDireccion().getCalle() != null
					? cliente.getDireccion().getCalle() + " " + cliente.getDireccion().getNumero()
					: "Sin calle"%>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>