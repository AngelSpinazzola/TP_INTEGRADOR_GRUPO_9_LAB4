<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <style>
		body {
		    background-color: #f5f5f5; 
		    margin: 0;
		    padding: 0;
		}
        .section-title {
            font-size: 24px;
            color: #333;
            margin-top: 20px;
            text-align: center;
        }
        .account-cards {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 20px;
        }
        .account-card {
            border: 1px solid #d1d1d1;
            border-radius: 20px;
            padding: 20px;
            width: 382px;
            text-align: left;
            background-color: #fff;
        }
		.account-card h3 {
		    margin: 0;
		    font-size: 18px;
		    color: #333;
			}
        .account-card p {
            margin: 5px 0;
            font-size: 14px;
        }
        .account-card button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .transactions-table {
            width: 60%;
            margin: 20px auto;
            background-color: #fff;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
        }
        .transactions-table th, .transactions-table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .transactions-table th {
            background-color: #e0e0e0;
            font-size: 16px;
        }
        .transactions-table .negative {
            color: red;
        }
        .transactions-table .positive {
            color: green;
        }
    </style>
</head>
<body>
	<%@ include file="Componentes/Head.jsp"%>
	<%@ include file="Componentes/Navbar.jsp"%>
    <!-- Sección de cuentas -->
    <div class="section-title">Mis cuentas</div>
    <div class="account-cards">
        <div class="account-card" style="border-color: #0044cc;">
            <h3>Caja de ahorro</h3>
            <p>Nº Cuenta: 100001</p>
            <p>CBU: 000022200202</p>
            <p>Saldo: $10,000.00</p>
            <button>Ver movimientos</button>
        </div>
        <div class="account-card" style="border-color: #0044cc;">
            <h3>Caja de ahorro</h3>
            <p>Nº Cuenta: 100005</p>
            <p>CBU: 00432201242</p>
            <p>Saldo: $25,000.00</p>
            <button>Ver movimientos</button>
        </div>
        <div class="account-card" style="border-color: #009933;">
            <h3>Cuenta corriente</h3>
            <p>Nº Cuenta: 820001</p>
            <p>CBU: 0053220304</p>
            <p>Saldo: $75,000.00</p>
            <button>Ver movimientos</button>
        </div>
    </div>

    <!-- Tabla de últimos movimientos -->
    <div class="section-title">Últimos movimientos</div>
    <table class="transactions-table">
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Concepto</th>
                <th>Cuenta</th>
                <th>Monto</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>15-12-24</td>
                <td>Transferencia a Ignacio D.</td>
                <td>CA - 100005</td>
                <td class="negative">- $7,000.00</td>
            </tr>
            <tr>
                <td>23-9-24</td>
                <td>Pago préstamo</td>
                <td>CC - 880001</td>
                <td class="negative">- $25,000.00</td>
            </tr>
            <tr>
                <td>10-8-24</td>
                <td>Transferencia de Mario G.</td>
                <td>CA - 100020</td>
                <td class="positive">+ $10,000.00</td>
            </tr>
            <tr>
                <td>2-8-24</td>
                <td>Transferencia de Pedro C.</td>
                <td>CC - 885503</td>
                <td class="positive">+ $27,000.00</td>
            </tr>
            <tr>
                <td>2-8-24</td>
                <td>Transferencia a Juan B.</td>
                <td>CA - 100005</td>
                <td class="negative">- $5,000.00</td>
            </tr>
        </tbody>
    </table>
</body>
