<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <div class="container">
        <h1>Gestion de cuentas</h1>
        <p class="subtitle">Administra las cuentas del cliente</p>

        <div class="info-container">
            <div class="client-info">
                <div class="info-row">
                    <label>Cliente:</label>
                    Juan Perez
                </div>
                <div class="info-row">
                    <label>Usuario:</label>
                    juanuser432
                </div>
                <div class="info-row">
                    <label>Email:</label>
                    juan.perez@gmail.com
                </div>
                <div class="info-row">
                    <label>DNI:</label>
                    2411232132
                </div>
            </div>

            <div class="balance-info">
                <h3>Balance total</h3>
                <p>$225.000</p>
                <p>3 cuentas activas</p>
            </div>

            <div class="create-account">
                <h3>Crear cuenta</h3>
                <p>Selecciona un tipo de cuenta</p>
                <select>
                    <option>Caja de ahorro</option>
                </select>
                <button class="crear-cuenta-btn">Crear cuenta</button>
            </div>
        </div>

        <div class="accounts-grid">
            <div class="account-card">
                <h3 class="account-title">Caja de ahorro</h3>
                <div class="account-details">
                    <p>N° Cuenta: 100001</p>
                    <p>CBU: 000022202202</p>
                    <p>Saldo: $125.000,00</p>
                </div>
                <div class="button-group">
                    <button class="eliminar-btn">Eliminar</button>
                    <button class="modificar-btn">Modificar</button>
                </div>
            </div>

            <div class="account-card">
                <h3 class="account-title">Cuenta corriente</h3>
                <div class="account-details">
                    <p>N° Cuenta: 880001</p>
                    <p>CBU: 00553220304</p>
                    <p>Saldo: $75.000,00</p>
                </div>
                <div class="button-group">
                    <button class="eliminar-btn">Eliminar</button>
                    <button class="modificar-btn">Modificar</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>