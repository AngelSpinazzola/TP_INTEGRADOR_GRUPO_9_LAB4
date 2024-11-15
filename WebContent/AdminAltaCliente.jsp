<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Componentes/Head.jsp"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agregar Médico</title>
</head>

<body>

	<%@ include file="Componentes/NavbarAdmin.jsp"%>

 <br> <br>
  <div class="container">
    <h1>Agregar Cliente</h1>
    <form action="procesar-datos.jsp" method="POST">
      <div class="form-group">
    	    <div class="form-field">
		        <label for="dni">DNI</label>
		        <input type="text" id="dni" name="dni" required>
	        </div>
	      
	      <div class="form-field">
	        <label for="name">Nombre</label>
	        <input type="text" id="nombre" name="name" required>
	      </div>
	      
	      <div class="form-field">
	        <label for="surname">Apellido</label>
	        <input type="text" id="apellido" name="surname" required>
	      </div>
      </div>
      
      <div class="form-group">
	      <div class="form-field" >
	        <label for="birthdate">Fecha de nacimiento</label>
	        <input type="date" id="fechaNacimiento" name="birthdate" required>
	      </div>
      
	       <div class="form-field">
	          <label for="nacionalidad">Nacionalidad</label> 
	          <select class="form-select">
					<option>Argentino</option>
					<option>Otra nacionalidad..</option>
			  </select>
	        </div> 
        
            <div class="form-field">
		        <label for="sexo">Sexo</label> <select class="form-select">
								<option>Masculino</option>
								<option>Femenino</option>
								<option>Otro</option>
							</select>
		     </div>
		     

        
      </div>

      <div class="form-group">
      
      	  <div class="form-field">
             <label for="provincia">Provincia</label> <select
								class="form-select">
								<option>Buenos Aires</option>
								<option>Otra Provincia..</option>
							</select>
		  </div>

      
      	  <div class="form-field">
            <label for="localidad">Localidad</label> <select
								class="form-select">
								<option>San Martin</option>
								<option>Otra Localidad..</option>
							</select>
	     </div>
      
         <div class="form-field">
             <label for="email">Correo electrónico</label>
             <input type="email" id="email" name="email" required>
	     </div>
	     
      </div>


         <div class="form-group">
      
      	  <div class="form-field">
        <label for="username">Nombre de usuario</label>
        <input type="text" id="usuario" name="username" required>
		  </div>

      
      	  <div class="form-field">
        <label for="password">Contraseña</label>
        <input type="password" id="contraseña" name="password" required>
	     </div>
      
         <div class="form-field">
        <label for="repeat-password">Repetir contraseña</label>
        <input type="password" id="contraseña2" name="repeat-password" required>
	     </div>
	     
	     <button type="submit" class="button">Volver</button>
		 <button type="submit" class="btn btn-customDarAlta">Dar de Alta</button>
	     
      </div>
    </form>
  </div>
  
    <style>
    /* Estilos basados en la imagen */
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      color: #333;
    }
    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: white;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-group {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 15px;
	}
	
	.form-field {
	    margin-bottom: 15px;
	}
    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    input, select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .radio-group {
      display: flex;
      align-items: center;
      margin-top: 5px;
    }
    .radio-group label {
      margin-right: 10px;
    }
    button {
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
    @media (max-width: 600px) {
      .container {
        padding: 10px;
      }
    }
  </style>
  
</body>


