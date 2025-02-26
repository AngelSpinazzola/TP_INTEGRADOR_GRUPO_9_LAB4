package dao;

import java.util.ArrayList;
import entidad.Cliente;

public interface IClienteDao {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes(int page, int pageSize);
	public int getTotalClientesCount();
	public int calcularTotalPaginas(int pageSize);
	public Cliente getDetalleCliente(int dni);
	public boolean EditarCliente (Cliente Cliente);
	public boolean ValidarDNI(int dni);
}
