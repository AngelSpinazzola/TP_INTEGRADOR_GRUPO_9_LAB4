<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
   <style>
    .container {
      max-width: 1000px;
      margin: 30px auto;
      padding: 20px;
    }
    .client-table-container {
      border: 1px solid #ddd;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-top: 30px; 
    }
    h2{
    	margin-bottom: 30px;
    }
    
    .client-table {
      width: 100%;
      border-collapse: collapse;
    }
    .client-table th, .client-table td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    .action-buttons {
      position: relative;
    }
    .action-buttons button {
      background-color: transparent;
      border: none;
      cursor: pointer;
    }
    .action-dropdown {
      display: none;
      position: absolute;
      background-color: #f1f1f1;
      min-width: 120px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
    }
    .action-dropdown a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }
    .action-dropdown a:hover {
      background-color: #ddd;
    }
    .action-buttons:hover .action-dropdown {
      display: block;
    }
    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }
    .pagination button {
      background-color: #f1f1f1;
      border: none;
      color: black;
      padding: 8px 16px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }
    .pagination button.active {
      background-color: #4CAF50;
      color: white;
    }
    
    .btn-nuevo-cliente-container {
	    display: flex;
	    justify-content: flex-end;
	    margin-bottom: 10px;    
 	}
 	
    .btn-nuevo-cliente {
 		width: 200px;
 	}
  </style>
    <%@ include file="Componentes/Head.jsp"%>
</head>
<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>

	 <div class="container">
    <h2>Gestión de Clientes</h2>
    <div class="btn-nuevo-cliente-container">
    	<a href="ServletAdmAlta?param=1">
       		<button class="btn-general btn-nuevo-cliente">Nuevo Cliente</button>
   		</a>
    </div>
    <div class="client-table-container">
      <table class="client-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>DNI</th>
          <th>Nombre y Apellido</th>
          <th>Estado</th>
          <th>Cuentas</th>
          <th>Acción</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1234</td>
          <td>22422424</td>
          <td>Leonardo Saenz</td>
          <td>Activo</td>
          <td>3</td>
          <td>
            <div class="action-buttons">
              <button><i class="fas fa-ellipsis-v"></i></button>
              <div class="action-dropdown">
                <a href="AdminDetalleCliente.jsp">Ver Cliente</a>
                <a href="AdminEditarCliente.jsp">Editar Cliente</a>
                <a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>4321</td>
          <td>22422424</td>
          <td>Mateo Perez</td>
          <td>Activo</td>
          <td>2</td>
          <td>
            <div class="action-buttons">
              <button><i class="fas fa-ellipsis-v"></i></button>
              <div class="action-dropdown">
                <a href="AdminDetalleCliente.jsp">Ver Cliente</a>
                <a href="AdminEditarCliente.jsp">Editar Cliente</a>
                <a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>5987</td>
          <td>22422424</td>
          <td>Marcos Ponzio</td>
          <td>Activo</td>
          <td>3</td>
          <td>
            <div class="action-buttons">
              <button><i class="fas fa-ellipsis-v"></i></button>
              <div class="action-dropdown">
                <a href="AdminDetalleCliente.jsp">Ver Cliente</a>
                <a href="AdminEditarCliente.jsp">Editar Cliente</a>
                <a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>1569</td>
          <td>22422424</td>
          <td>Leo Neder</td>
          <td>Baja</td>
          <td>2</td>
          <td>
            <div class="action-buttons">
              <button><i class="fas fa-ellipsis-v"></i></button>
              <div class="action-dropdown">
                <a href="AdminDetalleCliente.jsp">Ver Cliente</a>
                <a href="AdminEditarCliente.jsp">Editar Cliente</a>
                <a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>1236</td>
          <td>22422424</td>
          <td>Thomas Rulf</td>
          <td>Activo</td>
          <td>3</td>
          <td>
            <div class="action-buttons">
              <button><i class="fas fa-ellipsis-v"></i></button>
              <div class="action-dropdown">
                <a href="AdminDetalleCliente.jsp">Ver Cliente</a>
                <a href="AdminEditarCliente.jsp">Editar Cliente</a>
                <a href="AdminCuentasCliente.jsp">Gestionar Cuentas</a>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    </div>
    <div class="pagination">
      <button class="active">1</button>
      <button>2</button>
      <button>3</button>
      <button>4</button>
      <button>5</button>
    </div>
  </div>
</body>
</html>