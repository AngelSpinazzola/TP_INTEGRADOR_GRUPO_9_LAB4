package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidad.Cliente;
import entidad.Direccion;
import negocioImpl.ClienteNegocioImpl;

@WebServlet("/AltaClienteSv")
public class AltaClienteSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AltaClienteSv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		// Obtengo los datos del cliente
		String nombreUsuario = request.getParameter("nombreUsuario");
		String pass = request.getParameter("password");
		
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		int dni = Integer.parseInt(request.getParameter("dni"));
		String cuil = request.getParameter("cuil");
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		String sexo = request.getParameter("sexo");
		String nacionalidad = request.getParameter("nacionalidad");
		String email = request.getParameter("email");
		String idLocalidad = request.getParameter("localidad");
		
		String codigoPostal = request.getParameter("codigoPostal");
		String calle = request.getParameter("calle");
        int numero = Integer.parseInt(request.getParameter("numero"));
        
        // Creo el cliente y su direccion asociada, seteo los datos
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setNombre(nombre);
        nuevoCliente.setApellido(apellido);
        nuevoCliente.setDni(dni);
        nuevoCliente.setCuil(cuil);
        nuevoCliente.setSexo(sexo);
        nuevoCliente.setNacionalidad(nacionalidad);
        nuevoCliente.setNombreUsuario(nombreUsuario);
        nuevoCliente.setEmail(email);
        nuevoCliente.setPassword(pass);
        nuevoCliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));
        
        // Asigno la dirección al cliente
        Direccion nuevaDireccion = new Direccion(Integer.parseInt(idLocalidad) , codigoPostal, calle, numero);
        nuevoCliente.setDireccion(nuevaDireccion);
        
        ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();
        clienteNegocio.agregarCliente(nuevoCliente);
        response.sendRedirect("ListarClientesSv");
        
	}
}
