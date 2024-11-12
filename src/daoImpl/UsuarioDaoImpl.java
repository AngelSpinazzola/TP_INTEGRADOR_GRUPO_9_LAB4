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

	private static final String login = "SELECT U.Usuario, U.TipoUsuario, U.Estado " + "FROM usuarios U "
			+ "INNER JOIN clientes C ON C.IDUsuario = U.IDUsuario " + "WHERE C.Email = ? AND U.Contrasenia = ?";

	public static UsuarioDaoImpl ObtenerInstancia() {
		if (instancia == null) {
			instancia = new UsuarioDaoImpl();
		}
		return instancia;
	}

	@Override
	public Usuario Loguear(String email, String contraseña) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		Usuario usuario = null;

		try {
			statement = conexion.prepareStatement(login);
			statement.setString(1, email); 
			statement.setString(2, contraseña); 
			ResultSet rs = statement.executeQuery();
			TipoUsuario tipo = null;

			if (rs.next()) {
				String nombre = rs.getString("Usuario");
				int tipoCodigo = rs.getInt("TipoUsuario");

				switch (tipoCodigo) {
				case 1:
					tipo = TipoUsuario.admin;
					break;
				case 2:
					tipo = TipoUsuario.cliente;
					break;
				}

				boolean activo = rs.getBoolean("Estado");
				usuario = new Usuario(nombre, tipo, activo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuario;
	}

}
