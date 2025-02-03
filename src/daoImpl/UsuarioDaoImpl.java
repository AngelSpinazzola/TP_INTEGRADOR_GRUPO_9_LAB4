package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.sql.Connection;
import dao.IUsuarioDao;
import entidad.Cliente;
import entidad.Direccion;
import entidad.Localidad;
import entidad.Provincia;
import entidad.TipoUsuario;
import entidad.Usuario;

public class UsuarioDaoImpl implements IUsuarioDao {

	private static UsuarioDaoImpl instancia = null;
	
	public static UsuarioDaoImpl ObtenerInstancia() {
		if (instancia == null) {
			instancia = new UsuarioDaoImpl();
		}
		return instancia;
	}
	
	public Cliente Loguear(String email, String contraseña) {
	    Cliente cliente = null;
	    String sql = "{ CALL SP_DetalleUsuario(?, ?) }";

	    try (Connection cn = Conexion.getConnection();
	         CallableStatement ps = cn.prepareCall(sql)) {

	        // Configuración de parámetros
	        ps.setString(1, email);
	        ps.setString(2, contraseña);

	        try (ResultSet rs = ps.executeQuery()) {
	        	
	            if (rs.next()) {
	            	
	                cliente = new Cliente();

	                // Datos del cliente
	                cliente.setNombre(rs.getString("nombre"));
	                cliente.setApellido(rs.getString("apellido"));
	                cliente.setEmail(rs.getString("email"));
	                cliente.setDni(rs.getInt("dni"));
	                cliente.setCuil(rs.getString("cuil"));
	                cliente.setEstado(rs.getInt("estadoCli"));
	                cliente.setNumeroTelefono(rs.getString("numeroTelefonico"));

	                // Datos de dirección
	                Direccion direccion = new Direccion();
	                direccion.setCalle(rs.getString("calle"));
	                direccion.setNumero(rs.getInt("numero"));
	                direccion.setCodigoPostal(rs.getString("codigoPostal"));

	                // Datos de localidad y provincia
	                Localidad localidad = new Localidad();
	                localidad.setNombre(rs.getString("localidad"));

	                Provincia provincia = new Provincia();
	                provincia.setNombre(rs.getString("provincia"));

	                direccion.setLocalidad(localidad);
	                direccion.setProvincia(provincia);
	                cliente.setDireccion(direccion);

	                // Datos del usuario
	                Usuario usuario = new Usuario();
	                usuario.setNombreUsuario(rs.getString("usuario"));
	                usuario.setEstado(rs.getInt("estadoUsu"));
	                usuario.setPassword(rs.getString("contrasenia"));
	                usuario.setTipo(rs.getInt("tipoUsuario"));
	                cliente.setUsuario(usuario);
	             

	                // Aquí puedes enlazar el usuario al cliente si corresponde.
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("Error al intentar loguear al usuario con email: " + email);
	        e.printStackTrace();
	    }

	    return cliente;
	}
}
		


