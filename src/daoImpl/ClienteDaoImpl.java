package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import dao.IClienteDao;
import entidad.Cliente;
import entidad.Direccion;
import entidad.Localidad;
import entidad.Provincia;
import entidad.Usuario;

public class ClienteDaoImpl implements IClienteDao {
	
	@Override
	public boolean agregarCliente(Cliente cliente) {

		try(Connection cn = Conexion.getConnection()) {
		   
			String sql = "{CALL SP_AgregarCliente(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

			try (CallableStatement st = cn.prepareCall(sql)) {
				st.setString(1, cliente.getUsuario().getNombreUsuario());
				st.setString(2, cliente.getUsuario().getPassword());
				st.setInt(3, cliente.getDni());
				st.setString(4, cliente.getCuil());
				st.setString(5, cliente.getNombre());
				st.setString(6, cliente.getApellido());
				st.setString(7, cliente.getEmail());
				st.setString(8, cliente.getSexo());
				st.setString(9, cliente.getNacionalidad());
				st.setDate(10, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
				st.setString(11, cliente.getDireccion().getCodigoPostal());
				st.setString(12, cliente.getDireccion().getCalle());
				st.setInt(13, cliente.getDireccion().getNumero());
				st.setInt(14, cliente.getDireccion().getLocalidad().getIdLocalidad());
				
				st.registerOutParameter(15, Types.INTEGER); 
				st.registerOutParameter(16, Types.INTEGER);

				st.executeUpdate();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Cliente> listarClientes(int page, int pageSize) {
		
		int offset = (page - 1) * pageSize;

		String query = "SELECT c.IDUsuario, c.DNI, c.Nombre, c.Apellido, c.Estado, COUNT(cu.IDCuenta) AS cantCuentas "
				+ "FROM CLIENTES c " + "LEFT JOIN Usuarios u ON u.IDUsuario = c.IDUsuario "
				+ "LEFT JOIN Cuentas cu ON cu.DNICliente = c.DNI " + "WHERE u.TipoUsuario = 2 "
				+ "GROUP BY c.IDUsuario, c.DNI, c.Nombre, c.Apellido, c.Estado " + "LIMIT ? OFFSET ?";

		ArrayList<Cliente> listaClientes = new ArrayList<>();
		
		try ( Connection cn = Conexion.getConnection();
			  PreparedStatement ps = cn.prepareStatement(query)) {

			ps.setInt(1, pageSize);
			ps.setInt(2, offset);
			
			try (ResultSet rs = ps.executeQuery()){
				while (rs.next()) {
					Cliente cliente = new Cliente();
					cliente.setIDUsuario(rs.getInt("IDUsuario"));
					cliente.setDni(rs.getInt("DNI"));
					cliente.setNombre(rs.getString("Nombre"));
					cliente.setApellido(rs.getString("Apellido"));
					cliente.setEstado(rs.getInt("Estado"));
					cliente.setCantidadCuentas(rs.getInt("cantCuentas"));

					listaClientes.add(cliente);
				}
			} catch (Exception ex) {
		        ex.printStackTrace();
		    }
		} 		
		catch (Exception ex) {
	        ex.printStackTrace();
	    }
		return listaClientes;
	}

	@Override
	public int getTotalClientesCount() {
		String query = "SELECT COUNT(*) FROM CLIENTES c " + "LEFT JOIN Usuarios u ON u.IDUsuario = c.IDUsuario "
				+ "WHERE u.TipoUsuario = 2";

		int totalClientes = 0;

		try (Connection cn = Conexion.getConnection();
				PreparedStatement statement = cn.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {

			if (resultSet.next()) {
				totalClientes = resultSet.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalClientes;
	}

	@Override
	public int calcularTotalPaginas(int pageSize) {
		int totalClientes = getTotalClientesCount();
		return (int) Math.ceil((double) totalClientes / pageSize);
	}

	@Override
	public Cliente getDetalleCliente(int dni) {
		Cliente cliente = null;

		String sp = "{ CALL SP_DetalleCliente(?) }";

		try ( Connection con = Conexion.getConnection(); 
			  CallableStatement cs = con.prepareCall(sp)) {
			
			System.out.println(dni);
			cs.setInt(1, dni);
			
	        try (ResultSet rs = cs.executeQuery()) {
	            if (rs.next()) {
	                cliente = construirClienteDesdeResultSet(rs);
	            }
	        }
		} catch (Exception e) {
	        System.err.println("Error al obtener los detalles del cliente con DNI: " + dni);
			e.printStackTrace();
		}
		return cliente;
	}
	
	private Cliente construirClienteDesdeResultSet(ResultSet rs) throws SQLException {
	    Cliente cliente = new Cliente();
	    
	    cliente.setNombre(rs.getString("nombre"));
	    cliente.setApellido(rs.getString("apellido"));
	    cliente.setEmail(rs.getString("email"));
	    cliente.setDni(rs.getInt("dni"));
	    cliente.setCuil(rs.getString("cuil"));
	    cliente.setEstado(rs.getInt("estado"));
	    System.out.println(rs.getInt("estado"));
	    cliente.setNumeroTelefono(rs.getString("numeroTelefonico"));

	    Direccion direccion = new Direccion();
	    direccion.setCalle(rs.getString("calle"));
	    direccion.setNumero(rs.getInt("numero"));
	    direccion.setCodigoPostal(rs.getString("codigoPostal"));

	    Localidad localidad = new Localidad();
	    localidad.setNombre(rs.getString("localidad"));

	    Provincia provincia = new Provincia();
	    provincia.setNombre(rs.getString("provincia"));

	    direccion.setLocalidad(localidad);
	    direccion.setProvincia(provincia);
	    cliente.setDireccion(direccion);
	    
	    Usuario usuario = new Usuario();
        usuario.setNombreUsuario(rs.getString("usuario"));
        usuario.setEstado(1);
        usuario.setTipo(1);
        usuario.setPassword("");
        cliente.setUsuario(usuario);

	    return cliente;
	}

}
