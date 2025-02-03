package dao;

import entidad.Cliente;

public interface IUsuarioDao {
	Cliente Loguear(String nombre_usuario, String pass);
}
