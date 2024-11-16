<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco UTN - Resumen de Préstamos</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
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
            background-color: #cce5ff;
            border-radius: 4px;
        }

        .prestamos-dropdown {
            background-color: #1a4f7c;
            color: white;
            padding: 0.75rem;
            border-radius: 4px;
            margin-bottom: 0.5rem;
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

        .distribution-table {
            width: 100%;
            max-width: 800px;
            margin-top: 1rem;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
        }

        .table-header {
            background-color: #004b93;
            color: white;
            padding: 0.75rem;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        tr:last-child td {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-brand">
            <span>☰</span>
            Banco UTN
        </div>
        <button class="logout-btn">Salir</button>
    </nav>

    <div class="sidebar">
        <a href="#" class="menu-item">
            <span>🏠</span> Inicio
        </a>
        <a href="#" class="menu-item">
            <span>👥</span> Clientes
        </a>
        <div class="prestamos-dropdown">
            <span>💰</span> Préstamos
        </div>
        <div class="submenu">
            <a href="#" class="menu-item">Préstamos en revisión</a>
            <a href="#" class="menu-item">Préstamos activos</a>
            <a href="#" class="menu-item active">Resumen de préstamos</a>
        </div>
    </div>

    <div class="main-content">
        <h2 class="page-title">Resumen de préstamos</h2>
        
        <div class="distribution-table">
            <div class="table-header">
                Distribución por Tipo de Préstamo
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Tipo</th>
                        <th>Cantidad</th>
                        <th>Monto total</th>
                        <th>Porcentaje</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Personal</td>
                        <td>1</td>
                        <td>$500.000</td>
                        <td>33.3%</td>
                    </tr>
                    <tr>
                        <td>Hipotecario</td>
                        <td>1</td>
                        <td>$1.500.000</td>
                        <td>33.3%</td>
                    </tr>
                    <tr>
                        <td>Vacaciones</td>
                        <td>1</td>
                        <td>$25.000.000</td>
                        <td>33.3%</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>