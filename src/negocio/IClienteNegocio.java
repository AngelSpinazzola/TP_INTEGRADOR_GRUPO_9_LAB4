package negocio;

import java.util.ArrayList;
import entidad.Cliente;

public interface IClienteNegocio {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes(int page, int pageSize);
	public int getTotalClientesCount();
	public int calcularTotalPaginas(int pageSize);
	public Cliente getDetalleCliente(int dni);
}
