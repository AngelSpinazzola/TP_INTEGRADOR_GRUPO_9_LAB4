<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
   
   <div class="transfer-container">
       <h2>Transferir dinero</h2>
       <p class="transfer-subtitle">Selecciona una cuenta de origen, ingresa el monto y realiza la transferencia</p>

       <!-- Formulario de cuenta de origen -->
       <div class="transfer-form">
           <div class="section-header">Cuenta de origen</div>
           <div class="section-content">
               <label>Selecciona una cuenta</label>
               <select class="form-select">
                   <option>CA - 100001 - $10,000.00</option>
                   <option>CC - 880001 - $75,000.00</option>
               </select>
           </div>
       </div>

       <!-- Formulario de cuenta de destino -->
       <div class="transfer-form">
           <div class="section-header">Cuenta de destino</div>
           <div class="section-content">
               <label>Ingresá el CBU</label>
               <input type="text" class="form-input" placeholder="CBU">
               
               <label>Monto</label>
               <input type="text" class="form-input" placeholder="$0.00">
               
               <div class="button-container">
                   <a href="ClientePanel.jsp" class="btn-volver">Volver</a>
                   <button class="btn-transferir">Transferir</button>
               </div>
           </div>
       </div>
   </div>
</body>
