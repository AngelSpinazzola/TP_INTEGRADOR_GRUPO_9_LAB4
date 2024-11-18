package negocioImpl;

import java.util.ArrayList;

import dao.IClienteDao;
import daoImpl.ClienteDaoImpl;
import entidad.Cliente;
import entidad.Direccion;
import excepciones.ClienteNegocioException;
import negocio.IClienteNegocio;

public class ClienteNegocioImpl implements IClienteNegocio{
	private IClienteDao iClienteDao;
	
	public ClienteNegocioImpl() {
		this.iClienteDao = new ClienteDaoImpl();
	}
	
	@Override
	public boolean agregarCliente(Cliente cliente) {
		if (cliente == null) {
			System.out.println("El cliente no puede ser nulo");
			return false;
		}

		try {
		} catch (ClienteNegocioException e) {
			System.out.println("Error al verificar el cliente: " + e.getMessage());
			return false;
		}

		boolean resultado = iClienteDao.agregarCliente(cliente);
		
		return resultado;
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
