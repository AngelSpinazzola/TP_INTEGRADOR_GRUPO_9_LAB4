package negocioImpl;

import java.util.ArrayList;

import dao.IClienteDao;
import daoImpl.ClienteDaoImpl;
import entidad.Cliente;
import negocio.IClienteNegocio;

public class ClienteNegocioImpl implements IClienteNegocio{
	private IClienteDao iClienteDao;
	
	public ClienteNegocioImpl() {
		this.iClienteDao = new ClienteDaoImpl();
	}
	
	@Override
	public ArrayList<Cliente> listarClientes() {
		ArrayList<Cliente> clientes = iClienteDao.listarClientes();

		if (clientes == null || clientes.isEmpty()) {
			System.out.println("No hay clientes activos.");
			return new ArrayList<>();
		}

		return clientes;
	}
}
