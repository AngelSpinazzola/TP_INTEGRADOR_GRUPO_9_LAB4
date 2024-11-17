package daoImpl;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dao.IClienteDao;
import entidad.Cliente;

public class ClienteDaoImpl implements IClienteDao {

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
				cliente.setId(resultSet.getInt("IDUsuario"));
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
