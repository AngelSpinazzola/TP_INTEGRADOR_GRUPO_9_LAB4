<%@ page import="entidad.Cliente"%>
<% 
    Cliente cliente = (Cliente) request.getAttribute("cliente");
    if (cliente == null) {
        out.print("Cliente no encontrado.");
        return;
    }
%>
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
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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

        @media (max-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>

    <div class="container">
        <h2 class="page-title">Detalles de Cliente</h2>

        <div class="card">
            <h3 class="card-title">Información personal</h3>
            <div class="info-grid">
                 <span class="info-label">Usuario:</span>
            	<span><%= cliente.getNombreUsuario() %></span>
	            <span class="info-label">Nombre y apellido:</span>
	            <span><%= cliente.getNombre() + " " + cliente.getApellido() %></span>
	            <span class="info-label">Email:</span>
	            <span><%= cliente.getEmail() %></span>
	            <span class="info-label">DNI:</span>
	            <span><%= cliente.getDni() %></span>
	            <span class="info-label">Estado:</span>
	            <span><%= cliente.getEstado() == 1 ? "Activo" : "Inactivo" %></span>
	            <span class="info-label">Teléfono:</span>
	            <span><%= cliente.getTelefono() %></span>
                <span class="info-label">Dirección:</span>
                <span>Las heras 341</span>
            </div>
        </div>
        
        

        <div class="card">
            <h3 class="card-title">Resumen de cuentas</h3>
            <table>
                <thead>
                    <tr>
                        <th>Nro cuenta</th>
                        <th>Tipo de cuenta</th>
                        <th>Saldo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>100001</td>
                        <td>Caja de ahorro</td>
                        <td class="balance">$125.000</td>
                    </tr>
                    <tr>
                        <td>880001</td>
                        <td>Cuenta corriente</td>
                        <td class="balance">$75.000</td>
                    </tr>
                    <tr>
                        <td>100005</td>
                        <td>Caja de ahorro</td>
                        <td class="balance">$25.000</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h3 class="card-title">Resumen de préstamos</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Concepto</th>
                        <th>Monto</th>
                        <th>Cuotas</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>110</td>
                        <td>Hipotecario</td>
                        <td>$380.000</td>
                        <td>12</td>
                        <td><span class="status pending">Pendiente</span></td>
                    </tr>
                    <tr>
                        <td>120</td>
                        <td>Personal</td>
                        <td>$50.000</td>
                        <td>6</td>
                        <td><span class="status rejected">Rechazado</span></td>
                    </tr>
                    <tr>
                        <td>131</td>
                        <td>Vacaciones</td>
                        <td>$580.000</td>
                        <td>24</td>
                        <td><span class="status approved">Aprobado</span></td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
                <button>Anterior</button>
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button>Siguiente</button>
            </div>
        </div>
    </div>
</body>
</html>