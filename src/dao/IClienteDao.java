package dao;

import java.util.ArrayList;
import entidad.Cliente;
import entidad.Direccion;

public interface IClienteDao {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes(int page, int pageSize);
	public int getTotalClientesCount();
	public int calcularTotalPaginas(int pageSize);
}
