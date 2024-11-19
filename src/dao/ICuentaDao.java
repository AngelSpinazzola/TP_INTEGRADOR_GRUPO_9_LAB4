package dao;

import java.util.ArrayList;
import entidad.Cuenta;

public interface ICuentaDao {
	public ArrayList<Cuenta> getCuentasDelCliente(int dni);
}
