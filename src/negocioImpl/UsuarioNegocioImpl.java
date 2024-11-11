package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidad.Usuario;
import negocio.IUsuarioNegocio;

public class UsuarioNegocioImpl implements IUsuarioNegocio {

	private UsuarioDaoImpl usuarioDaoImpl = new UsuarioDaoImpl();

	@Override
	public Usuario login(String email, String pass) {
		Usuario usuarioRegistrado = null;

		usuarioRegistrado = usuarioDaoImpl.Loguear(email, pass);

		if (usuarioRegistrado == null) {
			return null;
		}
		return usuarioRegistrado;

	}
}
