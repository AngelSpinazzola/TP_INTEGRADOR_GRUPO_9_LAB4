<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="entidad.Cliente"%>

<!DOCTYPE html>
<head>
   <style>
       .transfer-container {
           max-width: 600px;
           margin: 50px auto;
           padding: 0 20px;
       }

       .transfer-container h2 {
           text-align: center;
           margin-bottom: 10px;
           font-size: 24px;
       }

       .transfer-subtitle {
           text-align: center;
           color: #666;
           margin-bottom: 30px;
       }

       .transfer-form {
           background: white;
           border-radius: 8px;
           box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
           overflow: hidden;
           margin-bottom: 30px; 
       }

       .transfer-section {
           padding: 20px;
           position: relative;
       }

       .section-header {
           background-color: var(--navbar-bg-color);
           color: white;
           padding: 12px 20px;
           font-weight: 500;
           border-top-left-radius: 8px;
           border-top-right-radius: 8px;
       }

       .section-content {
           padding: 20px;
           background-color: #f9f9f9;
           border-bottom-left-radius: 8px;
           border-bottom-right-radius: 8px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
       }

       .form-select, .form-input {
           width: 100%;
           padding: 10px;
           border: 1px solid #ddd;
           border-radius: 4px;
           font-size: 14px;
           margin-bottom: 15px;
           box-sizing: border-box;
       }

       label {
           display: block;
           margin-bottom: 8px;
           color: #333;
           font-size: 14px;
       }

       .button-container {
           display: flex;
           justify-content: space-between;
           margin-top: 20px;
       }

       .btn-volver {
           background-color: #e2e2e2;
           border: none;
           padding: 10px 20px;
           border-radius: 4px;
           cursor: pointer;
           font-size: 14px;
           text-decoration: none;
           color: #333;
           width: 20%;
       }

       .btn-transferir {
           background-color: var(--primary-color);
           color: white;
           border: none;
           padding: 10px 20px;
           border-radius: 4px;
           cursor: pointer;
           font-size: 14px;
           width: 70%;
       }

       .btn-transferir:hover {
           background-color: var(--secondary-color);
       }

       .btn-volver:hover {
           background-color: #d0d0d0;
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
   
<form action="TransferenciaSV" method="post"> 
   <div class="transfer-container">
       <h2>Transferir dinero</h2>
       <p class="transfer-subtitle">Selecciona una cuenta de origen, ingresa el monto y realiza la transferencia</p>
	
		
       <input type="hidden" name="dni" id="dni" value=<%=dniCliente%> >		
		
       <!-- Formulario de cuenta de origen -->
       <div class="transfer-form">
           <div class="section-header">Cuenta de origen</div>
           <div class="section-content">
               <select id="cuentaOrigen" name="CuentaOrigen" class="form-control">
                   <option value="0">Seleccione una cuenta</option>
                   <%
				ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
				if (listaCuentas != null) {
				    for (Cuenta cuenta : listaCuentas) {
				%>
				    <option value="<%=cuenta.getIdCuenta()%>" data-saldo="<%=cuenta.getSaldo()%>">
				        <%=cuenta.getCbu()%> - $<%=cuenta.getSaldo()%>
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
           </div>
       </div>
       
       <input type="hidden" name="saldoCuentaOrigen" id="saldoCuentaOrigen">


       <!-- Formulario de cuenta de destino --> 
       <div class="transfer-form">
           <div class="section-header">Cuenta de destino</div>
           <div class="section-content">
               <label>Ingresá el CBU</label>
 		       <input type="number" id="cuentaDestino" name="cuentaDestino" required class="form-control">
               
               <label>Monto</label>
               <input type="number" id="monto" name="monto" step="0.01" required class="form-control">
               
               
               <div class="button-container">
                   <a href="ClientePanel.jsp" class="btn-volver">Volver</a>
                   <button type="submit" class="btn-transferir">Transferir</button>
               </div>
           </div>
       </div>
   </div>
</form>

<script>
   document.getElementById("cuentaOrigen").addEventListener("change", function() {
       var saldoSeleccionado = this.options[this.selectedIndex].getAttribute("data-saldo");
       document.getElementById("saldoCuentaOrigen").value = saldoSeleccionado;
   });
</script>

</body>
