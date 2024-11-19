package negocio;

import java.util.ArrayList;
import entidad.Cuenta;

public interface ICuentaNegocio {
	public ArrayList<Cuenta> getCuentasDelCliente(int dni);
}	
