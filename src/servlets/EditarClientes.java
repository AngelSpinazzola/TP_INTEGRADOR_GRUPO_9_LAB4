package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Direccion;
import entidad.Localidad;
import entidad.Provincia;
import entidad.Usuario;
import negocioImpl.ClienteNegocioImpl;

import java.io.IOException;
/**
 * Servlet implementation class EditarClientes
 */
@WebServlet("/EditarClientes")
public class EditarClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
 @SuppressWarnings("unused")
@Override 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
     String nombreUsuario = request.getParameter("nombreUsuario");
     String pass = request.getParameter("password");
     int idUsuario = Integer.parseInt(request.getParameter("IDUsuario"));
     
     String nombre = request.getParameter("nombre");
     String apellido = request.getParameter("apellido");
     int dni = Integer.parseInt(request.getParameter("dni"));
     String cuil = request.getParameter("cuil");
     String fechaNacimiento = request.getParameter("fechaNacimiento");
     String sexo = request.getParameter("sexo");
     String nacionalidad = request.getParameter("nacionalidad");
     String email = request.getParameter("email");
     
     String IdDireccionStr = request.getParameter("IdDireccion");
     int idDireccion = 0;
     
     if (IdDireccionStr != null && !IdDireccionStr.trim().isEmpty()) {
         idDireccion = Integer.parseInt(IdDireccionStr.trim());
     } else {
         idDireccion = 0;
     }
     
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
     nuevoCliente.setEmail(email);
     nuevoCliente.setEstado(1);
     nuevoCliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));

     Provincia provincia = new Provincia(Integer.parseInt(idProvincia), "NombreProvincia");  
     Localidad localidad = new Localidad(Integer.parseInt(idLocalidad), "NombreLocalidad");  

     Direccion nuevaDireccion = new Direccion(idDireccion, numero, calle, codigoPostal, provincia, localidad); 
     nuevoCliente.setDireccion(nuevaDireccion);
     
     Usuario usuario = new Usuario();
     usuario.setNombreUsuario(nombreUsuario);
     usuario.setPassword(pass);
     usuario.setId(idUsuario);
     usuario.setTipo(2);
     usuario.setEstado(1);
     nuevoCliente.setUsuario(usuario);
     
     ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();
     if (nuevoCliente == null) {
    	    throw new IllegalArgumentException("El cliente no puede ser null");
    	}
     boolean res = clienteNegocio.editarCliente(nuevoCliente);
     
     if(res == true) {
    	 System.out.println("Registro editado correctamente");
     }
     else {
    	 System.out.println("error al editar el registro");
     }
 }
}
