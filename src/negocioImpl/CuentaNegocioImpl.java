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
	
	public boolean EliminarCuenta(int IDCuenta) {
		if (IDCuenta == 0) {
			System.out.println("El ID no puede ser igual a 0");
			return false;
		}

		boolean res = iCuentaDao.EliminarCuenta(IDCuenta);
		
		return res;
	}
	
	public boolean Transferir(int cuentaOrigen, int cuentaDestino, double monto) {
		if (cuentaOrigen == 0 && cuentaDestino == 0 && monto <= 0) {
			System.out.println("Los datos no pueden ser iguales a 0");
			return false;
		}

		boolean res = iCuentaDao.Transferencia(cuentaOrigen, cuentaDestino, monto);
		
		return res;
	}
	
	public boolean ValidarCBU(String cuentaDestino) {
		if (cuentaDestino == null) {
			System.out.println("La cuenta de destino no puede ser 0");
			return false;
		}

		boolean res = iCuentaDao.ValidarCBU(cuentaDestino);
		
		return res;
	}
	
	@Override
	public int getProximoID(){
		int ID = iCuentaDao.getProximoID();
		return ID;
	}
	
}
