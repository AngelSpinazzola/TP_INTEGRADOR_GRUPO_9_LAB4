package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
/**
 * Servlet implementation class EditarClientes
 */
@WebServlet("/EditarClientes")
public class EditarClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
 @Override 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String nombre = request.getParameter("nombre");
     String apellido = request.getParameter("apellido");
     String email = request.getParameter("email");
     String DNI = request.getParameter("dni");
     String Sexo = request.getParameter("sexo");
     String telefono = request.getParameter("telefono");
     String provincia = request.getParameter("provincia");
     String localidad = request.getParameter("localidad");
     String direccion = request.getParameter("direccion");
     String accion = request.getParameter("accion");

     if ("guardar".equals(accion)) {
         // Aqui se Realizan los cambios 
         response.getWriter().println("Se Guardaron los Cambios para el cliente: " + nombre + " " + apellido);
     } else if ("eliminar".equals(accion)) {
         // Aqui le damos de baja al  cliente
         response.getWriter().println("Se dio de Baja Correctamente al Cliente: " + nombre + " " + apellido);
     }
	}

}
