package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidad.Cliente;
import entidad.Usuario;
import negocio.IUsuarioNegocio;

public class UsuarioNegocioImpl implements IUsuarioNegocio {

	private UsuarioDaoImpl usuarioDaoImpl = new UsuarioDaoImpl();

	@Override
	public Cliente login(String email, String pass) {
		Cliente usuarioRegistrado = null;

		usuarioRegistrado = usuarioDaoImpl.Loguear(email, pass);
		
		if (usuarioRegistrado == null) {
			System.out.println("El usuario salio nulo o no se cargaron los datos o algun error che"); 
			return null;
		}
		return usuarioRegistrado;

	}
}







