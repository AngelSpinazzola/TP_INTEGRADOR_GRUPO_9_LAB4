package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Movimientos;

public interface ICuentaDao {
	public ArrayList<Cuenta> getCuentasDelCliente(int dni);
	public boolean agregarCuenta(Cuenta cuenta,Cliente cliente);
	public int getProximoID();
	public boolean EliminarCuenta(int iDCuenta);
	public int Transferencia(Movimientos Transferencia);
	public boolean ValidarCBU(String cuentaDestino);
	public ArrayList<Movimientos> obtenerMovimientosPorCuenta(int page, int pageSize, int idCuenta);
	public int getTotalMovimientosCount(int idCuenta);
}
