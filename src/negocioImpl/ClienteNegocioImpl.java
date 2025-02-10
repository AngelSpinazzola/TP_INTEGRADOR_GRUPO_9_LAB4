package negocioImpl;

import java.util.ArrayList;

import dao.IClienteDao;
import daoImpl.ClienteDaoImpl;
import entidad.Cliente;
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
	public ArrayList<Cliente> listarClientes(int page, int pageSize) {
	    ArrayList<Cliente> clientes = iClienteDao.listarClientes(page, pageSize);

	    if (clientes == null || clientes.isEmpty()) {
	        System.out.println("No hay clientes activos.");
	        return new ArrayList<>();
	    }

	    return clientes;
	}

	@Override
	public int calcularTotalPaginas(int pageSize) {
        int totalClientes = getTotalClientesCount(); 
        return (int) Math.ceil((double) totalClientes / pageSize); 
    }
	
    @Override
	public int getTotalClientesCount() {
        return iClienteDao.getTotalClientesCount();
    }
    
    @Override
    public Cliente getDetalleCliente(int dni) {
		return iClienteDao.getDetalleCliente(dni);
    }
    
	@Override
	public boolean editarCliente(Cliente cliente) {
		if (cliente == null) {
			System.out.println("El cliente no puede ser nulo");
			return false;
		}

		try {
		} catch (ClienteNegocioException e) {
			System.out.println("Error al verificar el cliente: " + e.getMessage());
			return false;
		}

		boolean resultado = iClienteDao.EditarCliente(cliente);
		
		return resultado;
	}

}
