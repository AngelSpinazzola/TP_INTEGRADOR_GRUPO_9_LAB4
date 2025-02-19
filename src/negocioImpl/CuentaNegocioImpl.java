package negocioImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.ICuentaDao;
import daoImpl.CuentaDaoImpl;
import entidad.Cliente;
import entidad.Cuenta;
import excepciones.ClienteNegocioException;
import negocio.ICuentaNegocio;

public class CuentaNegocioImpl implements ICuentaNegocio{
	ICuentaDao iCuentaDao = new CuentaDaoImpl();
	
	@Override
	public ArrayList<Cuenta> getCuentasDelCliente(int dni) {
		ArrayList<Cuenta> cuentas = iCuentaDao.getCuentasDelCliente(dni);
		
		return cuentas;
	}
	
	@Override
	public boolean agregarCuentas(Cuenta cuenta, Cliente cliente) {
		if (cuenta == null) {
			System.out.println("La Cuenta no puede ser nula");
			return false;
		}

		try {
		} catch (ClienteNegocioException e) {
			System.out.println("Error al verificar la Cuenta: " + e.getMessage());
			return false;
		}

		boolean resultado = iCuentaDao.agregarCuenta(cuenta,cliente);
		
		return resultado;
	}
	
	@Override
	public int getProximoID(){
		int ID = iCuentaDao.getProximoID();
		
		return ID;
	}
	
}
