<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Gestión de Préstamos</title>
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
            max-width: 800px;
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

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
        }

        select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            background-color: white;
        }

        .slider-container {
            margin: 1rem 0;
        }

        input[type="range"] {
            width: 100%;
            margin: 1rem 0;
        }

        .loan-summary {
            background-color: #e3f2fd;
            padding: 1rem;
            border-radius: 4px;
            margin: 1.5rem 0;
        }

        .loan-summary p {
            margin: 0.5rem 0;
            color: #333;
        }

        .submit-button {
            background-color: #26a69a;
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
        }

        .submit-button:hover {
            background-color: #2196f3;
        }

        .amount-display {
            font-size: 1.2rem;
            color: #333;
            margin-top: 0.5rem;
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
        <div class="card">
            <h1>Gestión de Préstamos</h1>
            
            <div class="tabs">
			    <a href="PrestamosSV?dni<%=dniCliente%>" class="tab-button">Mis préstamos</a>
			    <a href="CargarDesplegablesSv?dni=<%=dniCliente%>&action=getMisPrestamos"class="tab-button active">Solicitar préstamo</a>
			    <a href="PagarCuotas.jsp" class="tab-button ">Pagar cuotas</a>
			</div>

	<form id="loanForm" action="PrestamosSV" method="post">
	    <div class="form-group">
	        <label>Monto solicitado</label>
	        <input type="range" id="MontoPedido" name="MontoPedido" min="0" max="100000" step="1000" value="0">
	        <div class="amount-display">$ <span id="valorMonto">0.0</span></div>
	    </div>
	
	    <input type="hidden" name="dni" id="dni" value=<%=dniCliente%> >		
	
	    <div class="form-group">
	        <label>Plazo en cuotas</label>
	        <select id="cantMeses" name="cantMeses">
	            <option value="12">12 meses</option>
	            <option value="24">24 meses</option>
	            <option value="36">36 meses</option>
	        </select>
	    </div>
	
	    <label>Cuenta para acreditación</label>
	    <select id="cuentaOrigen" name="CuentaOrigen" class="form-control">
	        <option value="0">Seleccione el CBU de la cuenta</option>
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
	
	    <div class="loan-summary">
	        <h3>Resumen del préstamo</h3>
	        <p>Monto solicitado: $<span id="resumenMonto">0.0</span></p>
	        <p>Plazo: <span id="resumenPlazo">12</span> cuotas</p>
	        <p>Cuota mensual con interés: $<span id="pagoMensual">0.0</span></p>
	        <p><strong>Total a pagar:</strong> $<span id="resumenTotalPagar">0.0</span></p>
	    </div>
	    
		<%
		    // Obtener la fecha actual
		    Date fechaActual = new Date();
		    // Formatear la fecha en el formato "yyyy-MM-dd"
		    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		    String fechaCreacion = formato.format(fechaActual);
		%>  
       	<input type="hidden" id="FechaCreacion" name="FechaCreacion" class="form-control" value="<%= fechaCreacion %>" required>
		
 	  	<input type="hidden" name="TotalPagar" id="TotalPagar">
		
	    <button type="submit" class="submit-button">Solicitar</button>
	</form>
	</div>
	</div>
	
	<script>
	    const montoPedido = document.getElementById('MontoPedido');
	    const resumenMonto = document.getElementById('resumenMonto');
	    const cantidadMeses = document.getElementById('cantMeses');
	    const resumenPlazo = document.getElementById('resumenPlazo');
	    const pagoMensual = document.getElementById('pagoMensual');
	    const resumenTotalPagar = document.getElementById('resumenTotalPagar');
	    const totalPagarInput = document.getElementById('TotalPagar'); // input hidden que se enviará
	
	    function actualizarResumenPrestamo() {
	        const monto = parseFloat(montoPedido.value) || 0;
	        const plazo = parseInt(cantidadMeses.value) || 12;
	        const tasaInteres = 0.25; // 25% de tasa de interés anual
			
	        document.getElementById('valorMonto').textContent = monto.toFixed(2);
	        resumenMonto.textContent = monto.toFixed(2);
	        resumenPlazo.textContent = plazo;
	
	        const tasaInteresMensual = tasaInteres / 12;
	        const pago = (monto * tasaInteresMensual * Math.pow(1 + tasaInteresMensual, plazo)) /
	                    (Math.pow(1 + tasaInteresMensual, plazo) - 1);
	        
	        pagoMensual.textContent = pago.toFixed(2);
	        
	        const totalAPagar = pago * plazo;
	        resumenTotalPagar.textContent = totalAPagar.toFixed(2);
	
	        // Asegurar que el valor del input hidden también se actualiza
	        totalPagarInput.value = totalAPagar.toFixed(2);	        
	    }
	
	    montoPedido.addEventListener('input', actualizarResumenPrestamo);
	    cantidadMeses.addEventListener('change', actualizarResumenPrestamo);
	</script>

</body>
</html> 