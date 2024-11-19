package daoImpl;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import dao.IClienteDao;
import entidad.Cliente;

public class ClienteDaoImpl implements IClienteDao {

	@Override
	public boolean agregarCliente(Cliente cliente) {
		Connection conexion = null;
		int idUsuario = -1;
		int idDireccion = -1;

		try {
			conexion = Conexion.getConnection();
			System.out.println("Conexión establecida");

			conexion.setAutoCommit(false);

			// Inserto el usuario para luego obtener su ID y usarlo en el insert del cliente
			String queryUsuario = "INSERT INTO USUARIOS(Usuario, Contrasenia, TipoUsuario, Estado) VALUES (?, ?, ?, ?)";
			try (PreparedStatement statementUsuario = conexion.prepareStatement(queryUsuario,
					Statement.RETURN_GENERATED_KEYS)) {
				statementUsuario.setString(1, cliente.getNombreUsuario());
				statementUsuario.setString(2, cliente.getPassword());
				statementUsuario.setInt(3, 2); // Tipo de usuario "Cliente"
				statementUsuario.setBoolean(4, true); // Estado activo
				statementUsuario.executeUpdate();
				System.out.println("Usuario insertado correctamente");

				try (ResultSet generatedKeys = statementUsuario.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						idUsuario = generatedKeys.getInt(1);
					} else {
						throw new SQLException("Fallo al obtener el ID del usuario.");
					}
				}
			}

			// Inserto la direccion para obtener su ID y usarlo en el insert del cliente
			String queryDireccion = "INSERT INTO DIRECCIONES(IDLocalidad, CodigoPostal, Calle, Numero) VALUES (?, ?, ?, ?)";
			try (PreparedStatement statementDireccion = conexion.prepareStatement(queryDireccion,
					Statement.RETURN_GENERATED_KEYS)) {
				statementDireccion.setInt(1, cliente.getDireccion().getIdLocalidad());
				statementDireccion.setString(2, cliente.getDireccion().getCodigoPostal());
				statementDireccion.setString(3, cliente.getDireccion().getCalle());
				statementDireccion.setInt(4, cliente.getDireccion().getNumero());
				statementDireccion.executeUpdate();
				System.out.println("Dirección insertada correctamente");

				try (ResultSet generatedKeys = statementDireccion.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						idDireccion = generatedKeys.getInt(1);
					} else {
						throw new SQLException("Fallo al obtener el ID de la dirección.");
					}
				}
			}

			// Inserto el cliente
			String queryCliente = "INSERT INTO CLIENTES(DNI, CUIL, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, IDDireccion, Email, IDUsuario) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try (PreparedStatement statementCliente = conexion.prepareStatement(queryCliente)) {
				statementCliente.setInt(1, cliente.getDni());
				statementCliente.setString(2, cliente.getCuil());
				statementCliente.setString(3, cliente.getNombre());
				statementCliente.setString(4, cliente.getApellido());
				statementCliente.setString(5, cliente.getSexo());
				statementCliente.setString(6, cliente.getNacionalidad());
				statementCliente.setDate(7, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
				statementCliente.setInt(8, idDireccion);
				statementCliente.setString(9, cliente.getEmail());
				statementCliente.setInt(10, idUsuario);
				statementCliente.executeUpdate();
			}

			conexion.commit();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (conexion != null) {
					conexion.rollback();
				}
			} catch (SQLException rollbackEx) {
				rollbackEx.printStackTrace();
			}
			return false;
		} finally {
			try {
				if (conexion != null) {
					conexion.setAutoCommit(true);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
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

		String query = "SELECT u.Usuario, c.Nombre, c.Apellido, c.Email, c.DNI, c.ESTADO, "
				+ "t.NumeroTelefonico FROM clientes c " + "INNER JOIN usuarios u ON u.IDUsuario = c.IDUsuario "
				+ "LEFT JOIN telefonos t ON t.DNICliente = c.DNI " + "WHERE c.DNI = ?";

		try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

			ps.setInt(1, dni);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				cliente = new Cliente();
				cliente.setNombreUsuario(rs.getString("Usuario"));
				cliente.setNombre(rs.getString("Nombre"));
				cliente.setApellido(rs.getString("Apellido"));
				cliente.setEmail(rs.getString("Email"));
				cliente.setDni(rs.getInt("DNI"));
				cliente.setEstado(rs.getInt("ESTADO"));
				cliente.setTelefono(rs.getString("NumeroTelefonico"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cliente;
	}

}
