package negocio;

import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Cliente;
import entidad.Cuenta;

public interface ICuentaNegocio {
	public ArrayList<Cuenta> getCuentasDelCliente(int dni);
	public boolean agregarCuentas(Cuenta cuenta, Cliente cliente);
	public int getProximoID();
	
	
}	
