package negocio;

import java.util.ArrayList;
import entidad.Cliente;
import entidad.Direccion;

public interface IClienteNegocio {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes();
}
