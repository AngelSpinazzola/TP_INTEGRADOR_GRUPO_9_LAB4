package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Cliente;
import entidad.Cuenta;

public interface ICuentaDao {
	public ArrayList<Cuenta> getCuentasDelCliente(int dni);
	public boolean agregarCuenta(Cuenta cuenta,Cliente cliente);
	public int getProximoID();
}
