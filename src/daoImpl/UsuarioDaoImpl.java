package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import dao.IUsuarioDao;
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

	@Override
	public Usuario Loguear(String email, String contraseña) {
		String login = "SELECT U.Usuario, U.TipoUsuario, U.Estado " + "FROM usuarios U "
				+ "INNER JOIN clientes C ON C.IDUsuario = U.IDUsuario " + "WHERE C.Email = ? AND U.Contrasenia = ?";
		Usuario usuario = null;

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(login)) {

			statement.setString(1, email);
			statement.setString(2, contraseña);

			try (ResultSet rs = statement.executeQuery()) {
				if (rs.next()) {
					String nombre = rs.getString("Usuario");
					int tipoCodigo = rs.getInt("TipoUsuario");
					int estado = rs.getInt("Estado");

					TipoUsuario tipo = null;
					switch (tipoCodigo) {
					case 1:
						tipo = TipoUsuario.admin;
						break;
					case 2:
						tipo = TipoUsuario.cliente;
						break;
					}

					usuario = new Usuario(nombre, tipo, estado);
				}
			}
		} catch (SQLException e) {
			System.err.println("Error al intentar loguear al usuario: " + e.getMessage());
		}

		return usuario;
	}

}
