<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="entidad.Movimientos" %>
<%@ page import="entidad.TipoMovimiento" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Reportes de Movimientos</title>
    <%@ include file="Componentes/Head.jsp"%>

    <!-- Agregar estilos de Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
    <%@ include file="Componentes/NavbarAdmin.jsp"%>

    <div class="container mt-4">
        <h2 class="text-center">Seleccionar Rango de Fechas</h2>

        <!-- Formulario mejorado -->
        <form action="ListarMovimientosSV" method="GET" class="row g-3 justify-content-center">
            <div class="col-md-3">
                <label for="fechaInicio" class="form-label">Fecha Inicio:</label>
                <input type="date" name="fechaInicio" class="form-control" required>
            </div>
            <div class="col-md-3">
                <label for="fechaFin" class="form-label">Fecha Fin:</label>
                <input type="date" name="fechaFin" class="form-control" required>
            </div>
            <div class="col-md-3 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Buscar Movimientos</button>
            </div>
        </form>

        <!-- Mensaje de error -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger mt-3" role="alert">
                <%= error %>
            </div>
        <% } %>

        <%
            List<Movimientos> movimientos = (List<Movimientos>) request.getAttribute("movimientos");
            if (movimientos != null && !movimientos.isEmpty()) {
        %>
            <h2 class="mt-4 text-center">Listado de Movimientos</h2>
            <div class="table-responsive">
                <table class="table table-striped table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>ID Movimiento</th>
                            <th>Fecha</th>
                            <th>Detalle</th>
                            <th>Importe</th>
                            <th>ID Cuenta Envia</th>
                            <th>ID Cuenta Recibe</th>
                            <th>Tipo Movimiento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Movimientos m : movimientos) { %>
                        <tr>
                            <td><%= m.getIDMovimiento() %></td>
                            <td><%= m.getFecha() %></td>
                            <td><%= m.getDetalle() %></td>
                            <td><%= m.getImporte() %></td>
                            <td><%= (m.getIDCuentaEnvia() != 0) ? m.getIDCuentaEnvia() : "N/A" %></td>
                            <td><%= (m.getIDCuentaRecibe() != null) ? m.getIDCuentaRecibe() : "N/A" %></td>
                            <td><%= m.getTIpoMov().getDescripcion() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else if (movimientos != null) { %>
            <div class="alert alert-warning mt-4 text-center" role="alert">
                No se encontraron movimientos en el rango de fechas seleccionado.
            </div>
        <% } %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
