<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import="entidad.Cliente"%>
<%@ page import="entidad.Cuenta"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
	<%@ include file="Componentes/Head.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Cuenta Cliente</title>
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .form-header h2 {
            color: #2c3e50;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4a5568;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 0.875rem;
            transition: all 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
        }

        .form-control:disabled,
        .form-control[readonly] {
            background-color: #f7fafc;
            cursor: not-allowed;
        }

        select.form-control {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .boton {
            padding: 0.75rem 1rem;
            border: none;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: #3182ce;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2c5282;
        }

        .btn-secondary {
            background-color: #e2e8f0;
            color: #4a5568;
        }

        .btn-secondary:hover {
            background-color: #cbd5e0;
        }

        @media (max-width: 640px) {
            body {
                padding: 1rem;
            }

            .container {
                padding: 1rem;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<%@ include file="Componentes/NavbarAdmin.jsp"%>

	<%
	    // Obtener la fecha actual
	    Date fechaActual = new Date();
	    // Formatear la fecha en el formato "yyyy-MM-dd"
	    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	    String fechaCreacion = formato.format(fechaActual);

		
		request.setCharacterEncoding("UTF-8");
		Cliente cliente = (Cliente) request.getAttribute("cliente");
		int ProximoID = ((Integer) request.getAttribute("proximoID")).intValue();
		
		int dniCliente = 0;
		if (cliente != null) {
		    dniCliente = cliente.getDni();
		}
	%>
	<br><br>
	 
    <div class="container">
    	
        <div class="form-header">
            <h2>Crear Nueva Cuenta</h2>
        </div>
        
        <form action="CuentasSV" method="post">
            <div class="form-group">
                <label for="IDcuenta">ID Cuenta</label>
                <input type="number" id="IDcuenta" name="IDcuenta" class="form-control" value="<%=ProximoID%>" required>
            </div>

            <div class="form-group">
                <label for="IDTipoCuenta">Tipo de Cuenta</label>
                <select name="IDTipoCuenta" id="IDTipoCuenta" class="form-control" required>
                    <option value="">Seleccione un tipo</option>
                    <option value="1">Caja de Ahorro</option>
                    <option value="2">Cuenta Corriente</option>
                </select>
            </div>

            <div class="form-group">
                <label for="CBU">CBU</label>
                <input type="text" id="CBU" minlength="12" maxlength="12" name="CBU" class="form-control" required>
            </div>

            <div class="form-group">           
                <label for="dni">DNI:</label><br>
				<span><%=dniCliente%></span>
			    <input type="hidden" name="dni" value="<%=dniCliente%>">
            </div>

            <div class="form-group">
                <label for="FechaCreacion">Fecha de Creación</label>
                <input type="date" id="FechaCreacion" name="FechaCreacion" class="form-control" value="<%= fechaCreacion %>" required>
            </div>

            <div class="form-group">
                <label for="Saldo">Saldo Inicial</label>
                <input type="text" id="Saldo" name="Saldo" value="10000.00" class="form-control" readonly>
            </div>

            <div class="button-group">
                <button type="submit" class="boton btn-primary">Crear Cuenta</button>
                <button type="button" onclick="window.location.href='ListarClientesSv'" class="btn btn-secondary">Volver a la lista</button>
            </div>
        </form>
    </div>
    <br><br>
</body>
</html>
