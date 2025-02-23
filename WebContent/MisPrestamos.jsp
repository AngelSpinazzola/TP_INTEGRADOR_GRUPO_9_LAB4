<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <div class="container">
        <div class="card">
            <h1>Gestión de Préstamos</h1>
            
            <div class="tabs">
			    <a href="Prestamos.jsp" class="tab-button">Solicitar prestamo</a>
			    <a href="MisPrestamos.jsp" class="tab-button active">Mis prestamos</a>
			    <a href="PagarCuotas.jsp" class="tab-button ">Pagar cuotas</a>
			</div>


            <form id="loanForm" action="solicitarPrestamo" method="post">
    <!-- DNI del Cliente -->
    <div class="form-group">
        <label for="dniCliente">DNI del Cliente</label>
        <input type="text" id="dniCliente" name="dniCliente" required>
    </div>

    <!-- Monto Solicitado -->
    <div class="form-group">
        <label for="montoPedido">Monto solicitado</label>
        <input type="range" id="montoPedido" name="montoPedido" min="0" max="5238000" step="1000" value="2238000">
        <div class="amount-display">$ <span id="amountValue">2238000.00</span></div>
    </div>

    <!-- Plazo en Cuotas -->
    <div class="form-group">
        <label for="cuotas">Plazo en cuotas</label>
        <select id="cuotas" name="cuotas">
            <option value="12">12 meses</option>
            <option value="24">24 meses</option>
            <option value="36">36 meses</option>
        </select>
    </div>

    <!-- Tipo de Préstamo -->
    <div class="form-group">
        <label for="idTipoPrestamo">Tipo de Prestamo</label>
        <select id="idTipoPrestamo" name="idTipoPrestamo">
            <option value="1">Personal</option>
            <option value="2">Hipotecario</option>
            <option value="3">Automotor</option>
        </select>
    </div>

    <!-- Botón de Enviar -->
    <button type="submit" class="submit-button">Solicitar</button>
</form>

        </div>
    </div>

    <script>
        const loanAmount = document.getElementById('loanAmount');
        const amountValue = document.getElementById('amountValue');
        const summaryAmount = document.getElementById('summaryAmount');
        const loanTerm = document.getElementById('loanTerm');
        const summaryTerm = document.getElementById('summaryTerm');
        const monthlyPayment = document.getElementById('monthlyPayment');

        function updateLoanSummary() {
            const amount = parseFloat(loanAmount.value);
            const term = parseInt(loanTerm.value);
            const interestRate = 0.25; // 25% annual interest rate

            amountValue.textContent = amount.toFixed(2);
            summaryAmount.textContent = amount.toFixed(2);
            summaryTerm.textContent = term;

            // Calculate monthly payment with interest
            const monthlyInterestRate = interestRate / 12;
            const payment = (amount * monthlyInterestRate * Math.pow(1 + monthlyInterestRate, term)) / 
                          (Math.pow(1 + monthlyInterestRate, term) - 1);
            
            monthlyPayment.textContent = payment.toFixed(2);
        }

        loanAmount.addEventListener('input', updateLoanSummary);
        loanTerm.addEventListener('change', updateLoanSummary);

        document.getElementById('loanForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Solicitud de préstamo enviada correctamente');
        });
    </script>
</body>
</html>