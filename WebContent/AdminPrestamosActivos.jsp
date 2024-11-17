<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Préstamos Activos</title>
    <style>
        * {
            box-sizing: border-box;
        }

        .navbar {
            background-color: #004b93;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            font-size: 1.2rem;
            font-weight: bold;
        }

        .logout-btn {
            background-color: #39a9b3;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .sidebar {
            width: 200px;
            background-color: #f5f5f5;
            height: calc(100vh - 56px);
            padding: 1rem;
            float: left;
        }

        .menu-item {
            padding: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            color: #333;
            text-decoration: none;
        }

        .submenu {
            margin-left: 1rem;
        }

        .submenu .menu-item {
            padding: 0.5rem 0.75rem;
        }

        .menu-item.active {
            background-color: #1a4f7c;
            color: white;
            border-radius: 4px;
        }

        .main-content {
            margin-left: 200px;
            padding: 2rem;
        }

        .page-title {
            color: #333;
            margin-bottom: 2rem;
            font-size: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
            background-color: white;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            font-weight: 600;
            color: #333;
        }

        .pagination {
            margin-top: 1rem;
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.9rem;
        }

        .pagination a {
            padding: 0.25rem 0.5rem;
            text-decoration: none;
            color: #004b93;
        }

        .pagination a.active {
            background-color: #004b93;
            color: white;
            border-radius: 4px;
        }

        .prestamos-dropdown {
            background-color: #1a4f7c;
            color: white;
            padding: 0.75rem;
            border-radius: 4px;
            margin-bottom: 0.5rem;
        }
    </style>
	<%@ include file="Componentes/Head.jsp"%>
</head>
<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>
 
    <div class="main-content">
        <h2 class="page-title">Préstamos activos</h2>
        <table>
            <thead>
                <tr>
                    <th>Nombre y apellido</th>
                    <th>DNI</th>
                    <th>Concepto</th>
                    <th>Monto solicitado</th>
                    <th>Deuda pendiente</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Armando Barreda</td>
                    <td>3850005</td>
                    <td>Hipotecario</td>
                    <td>$50.000</td>
                    <td>$41.666</td>
                </tr>
                <tr>
                    <td>Bob Arnold</td>
                    <td>6850005</td>
                    <td>Personal</td>
                    <td>$95.000</td>
                    <td>$95.000</td>
                </tr>
                <tr>
                    <td>Leo Pondo</td>
                    <td>1241334</td>
                    <td>Hipotecario</td>
                    <td>$50.000</td>
                    <td>$50.000</td>
                </tr>
                <tr>
                    <td>Pepe Saenz</td>
                    <td>4214141</td>
                    <td>Vacaciones</td>
                    <td>$35.000</td>
                    <td>$35.000</td>
                </tr>
                <tr>
                    <td>Ricardo Iorio</td>
                    <td>9850005</td>
                    <td>Vacaciones</td>
                    <td>$195.000</td>
                    <td>$162.500</td>
                </tr>
            </tbody>
        </table>
        <div class="pagination">
            <span>Mostrando página 1 de 3</span>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">Siguiente</a>
        </div>
    </div>
</body>
</html>