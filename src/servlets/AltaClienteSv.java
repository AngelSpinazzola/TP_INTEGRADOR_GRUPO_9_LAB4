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
import entidad.Localidad;
import entidad.Provincia;
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
        String idProvincia = request.getParameter("provincia"); 
        String codigoPostal = request.getParameter("codigoPostal");
        String calle = request.getParameter("calle");
        int numero = Integer.parseInt(request.getParameter("numero"));
        
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

        Provincia provincia = new Provincia(Integer.parseInt(idProvincia), "NombreProvincia");  
        Localidad localidad = new Localidad(Integer.parseInt(idLocalidad), "NombreLocalidad");  

        Direccion nuevaDireccion = new Direccion(0, numero, calle, codigoPostal, provincia, localidad); 
        nuevoCliente.setDireccion(nuevaDireccion);
        
        ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();
        clienteNegocio.agregarCliente(nuevoCliente);

        response.sendRedirect("ListarClientesSv");   
	}
}
