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

public class ClienteDaoImpl implements IClienteDao {

	@Override
	public boolean agregarCliente(Cliente cliente) {
		Connection conexion = null;

		try {
			conexion = Conexion.getConnection();
			String query = "{CALL SP_AgregarCliente(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

			try (CallableStatement statement = conexion.prepareCall(query)) {
				statement.setString(1, cliente.getNombreUsuario());
				statement.setString(2, cliente.getPassword());
				statement.setInt(3, cliente.getDni());
				statement.setString(4, cliente.getCuil());
				statement.setString(5, cliente.getNombre());
				statement.setString(6, cliente.getApellido());
				statement.setString(7, cliente.getSexo());
				statement.setString(8, cliente.getNacionalidad());
				statement.setDate(9, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
				statement.setString(10, cliente.getDireccion().getCodigoPostal());
				statement.setString(11, cliente.getDireccion().getCalle());
				statement.setInt(12, cliente.getDireccion().getNumero());
				statement.setInt(13, cliente.getDireccion().getLocalidad().getIdLocalidad());
				statement.registerOutParameter(14, Types.INTEGER); 
				statement.registerOutParameter(15, Types.INTEGER);

				statement.executeUpdate();
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

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query)) {

			statement.setInt(1, pageSize);
			statement.setInt(2, offset);

			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Cliente cliente = new Cliente();
					cliente.setDni(resultSet.getInt("DNI"));
					cliente.setNombre(resultSet.getString("Nombre"));
					cliente.setApellido(resultSet.getString("Apellido"));
					cliente.setEstado(resultSet.getInt("Estado"));
					cliente.setCantidadCuentas(resultSet.getInt("cantCuentas"));

					listaClientes.add(cliente);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaClientes;
	}

	@Override
	public int getTotalClientesCount() {
		String query = "SELECT COUNT(*) FROM CLIENTES c " + "LEFT JOIN Usuarios u ON u.IDUsuario = c.IDUsuario "
				+ "WHERE u.TipoUsuario = 2";

		int totalClientes = 0;

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query);
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

		try (Connection conn = Conexion.getConnection(); CallableStatement cs = conn.prepareCall(sp)) {

			cs.setInt(1, dni);
			ResultSet rs = cs.executeQuery();

			if (rs.next()) {
				cliente = new Cliente();

				cliente.setNombreUsuario(rs.getString("usuario"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setEmail(rs.getString("email"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setCuil(rs.getString("cuil"));
				cliente.setEstado(rs.getInt("estado"));
				cliente.setTelefono(rs.getString("numeroTelefonico"));

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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cliente;
	}

}
