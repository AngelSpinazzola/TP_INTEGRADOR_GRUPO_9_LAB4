<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
	<%@ include file="Componentes/Head.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN</title>
    <style>
        .menu-icon {
            font-size: 1.5rem;
            cursor: pointer;
        }

        .salir-btn {
            background-color: #2E7D32;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        h1 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .subtitle {
            color: #666;
            margin-bottom: 2rem;
        }

        .info-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .client-info {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .balance-info {
            background: #4B77BE;
            color: white;
            padding: 1.5rem;
            border-radius: 8px;
            text-align: center;
        }

        .create-account {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .info-row {
            margin-bottom: 1rem;
        }

        .info-row label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.25rem;
        }

        select {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .crear-cuenta-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .accounts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .account-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .account-title {
            color: #4B77BE;
            margin-bottom: 1rem;
            font-weight: bold;
        }

        .account-details {
            margin-bottom: 1rem;
        }

        .button-group {
            display: flex;
            gap: 1rem;
        }

        .eliminar-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .modificar-btn {
            background-color: white;
            border: 1px solid #ddd;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<%@ include file="Componentes/NavbarAdmin.jsp"%>
<%
Cliente cliente = (Cliente) request.getAttribute("cliente");
ArrayList<Cuenta> cuentas =(ArrayList<Cuenta>) request.getAttribute("cuentas");
if (cuentas == null) {
	out.print("Cuentas no encontrado.");
	return;
}
%>
	
    <div class="container">
        <h1>Gestion de cuentas</h1>
        <p class="subtitle">Administra las cuentas del cliente</p>

        <div class="info-container">
            <div class="client-info">
                <div class="info-row">
                    <label>Cliente:</label>
                 <div class="info-row">
				<span class="info-label">Nombre y Apellido:</span> <span><%=cliente.getNombre()%> <%=cliente.getApellido()%></span>
				</div>   
                </div>
                <div class="info-row">
				<span class="info-label">Usuario:</span> <span><%=cliente.getUsuario().getNombreUsuario()%></span>
				</div>
                <div class="info-row">
							<span class="info-label">Email:</span> <span><%=cliente.getEmail()%></span>
				</div>
                <div class="info-row">
				<span class="info-label">DNI:</span><span><%=cliente.getDni()%></span>
				</div>
            </div>
<div class="balance-info">
    <h3>Balance total</h3>
    <%
        double balanceTotal = 0;
        for (Cuenta cuenta : cuentas) {
            balanceTotal += cuenta.getSaldo();
        }
    %>
    <p><strong>Saldo total:</strong> $<%= String.format("%.2f", balanceTotal) %></p>
    <h3>Cantidad de cuentas</h3>
     <p><strong>Total de cuentas:</strong> <%= cuentas.size() %></p>
</div>
<div class="create-account">
    <% if (cuentas.size() < 3) { %>
        	<h3 style="width: 484px; ">Crear cuenta</h3>
     <div class="btn-nuevo-cliente-container">
			<a href="DetalleClienteSv?dni=<%= cliente.getDni() %>&action=CrearCuenta">
				<button class="btn-general crear-cuenta-btn ">Nuevo Cliente</button>
			</a>
	</div>
    <% } else { %>
        <p style="color: blue; font-weight: bold;">El cliente ya tiene 3 cuentas y no se puede crear mas.</p>
    <% } %>
</div>

        </div>
        <div class="accounts-grid">
            <% for (Cuenta cuenta : cuentas) { %>
                <div class="account-card">
                    <h3 class="account-title"><%= cuenta.getTipoCuenta().getTipo() %></h3>
                    <div class="account-details">
                        <p><strong>Numero de Cuenta:</strong> <%= cuenta.getIdCuenta() %></p>
                        <p><strong>Fecha:</strong><%= cuenta.getFechaCreacion()%></p>
                        <p><strong>CBU:</strong> <%= cuenta.getCbu() %></p>
                        <p><strong>Saldo:</strong> $<%= cuenta.getSaldo() %></p>
                    </div>
                    <div class="button-group">
                        <form action="ServletEliminarCuenta" method="post">
                            <input type="hidden" name="idCuenta" value="<%= cuenta.getIdCuenta() %>">
                            <button type="submit" class="eliminar-btn">Eliminar</button>
                        </form>
                        <form action="ServletModificarCuenta" method="post">
                            <input type="hidden" name="idCuenta" value="<%= cuenta.getIdCuenta() %>">
                            <button type="submit" class="modificar-btn">Modificar</button>
                        </form>
                    </div>
           </div>
            <% } %>
         </div>
         <div class="button-group mt-4">
            <button type="button" class="btn btn-secondary btn-volver" onclick="history.back()">Volver</button>
        </div>
    </div>
</body>
</html>