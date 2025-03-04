<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="entidad.Movimientos" %>
<%@ page import="entidad.TipoMovimiento" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportes de Movimientos</title>
</head>
<%@ include file="Componentes/Head.jsp"%>
<body>
<%@ include file="Componentes/NavbarAdmin.jsp"%>

<h2>Seleccionar rango de fechas</h2>
<form action="ListarMovimientosSV" method="GET">
    <label for="fechaInicio">Fecha Inicio:</label>
    <input type="date" name="fechaInicio" required>

    <label for="fechaFin">Fecha Fin:</label>
    <input type="date" name="fechaFin" required>

    <button type="submit">Buscar Movimientos</button>
</form>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color: red;"><%= error %></p>
<% } %>

<%
    List<Movimientos> movimientos = (List<Movimientos>) request.getAttribute("movimientos");
    if (movimientos != null && !movimientos.isEmpty()) {
%>
    <h2>Listado de Movimientos</h2>
    <table border="1">
        <tr>
            <th>ID Movimiento</th>
            <th>Fecha</th>
            <th>Detalle</th>
            <th>Importe</th>
            <th>ID Cuenta Envia</th>
            <th>ID Cuenta Recibe</th>
            <th>Tipo Movimiento</th>
        </tr>
        <% for (Movimientos m : movimientos) { %>
        <tr>
            <td><%= m.getIDMovimiento() %></td>
            <td><%= m.getFecha() %></td>
            <td><%= m.getDetalle() %></td>
            <td><%= m.getImporte() %></td>
            <td><%= m.getIDCuentaEnvia() %></td>
            <td><%= m.getIDCuentaRecibe() %></td>
            <td><%= m.getTIpoMov().getDescripcion() %></td>
        </tr>
        <% } %>
    </table>
<% } else if (movimientos != null) { %>
    <p>No se encontraron movimientos en el rango de fechas seleccionado.</p>
<% } %>

</body>
</html>
