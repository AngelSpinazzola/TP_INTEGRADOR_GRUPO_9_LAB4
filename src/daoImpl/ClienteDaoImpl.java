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
	public ArrayList<Cliente> listarClientes() {
		String query = "SELECT c.IDUsuario, c.DNI, c.Nombre, c.Apellido, c.Estado, COUNT(cu.IDCuenta), u.TipoUsuario AS cantCuentas\r\n"
				+ "FROM CLIENTES c\r\n" + "INNER JOIN Usuarios u ON u.IDUsuario = c.IDUsuario\r\n"
				+ "INNER JOIN Cuentas cu ON cu.DNICliente = c.DNI\r\n" + "WHERE u.TipoUsuario = 2\r\n"
				+ "GROUP BY c.IDUsuario, c.DNI, c.Nombre, c.Apellido, c.Estado;\r\n" + "";

		ArrayList<Cliente> listaClientes = new ArrayList<>();

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				Cliente cliente = new Cliente();
				cliente.setDni(resultSet.getInt("DNI"));
				cliente.setNombre(resultSet.getString("Nombre"));
				cliente.setApellido(resultSet.getString("Apellido"));
				cliente.setEstado(resultSet.getInt("Estado"));
				cliente.setCantidadCuentas(resultSet.getInt("cantCuentas"));

				listaClientes.add(cliente);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaClientes;
	}
}
