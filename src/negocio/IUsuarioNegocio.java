package negocio;

import entidad.Cliente;

public interface IUsuarioNegocio {
	Cliente login(String email, String pass);
}
