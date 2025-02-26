package negocioImpl;

import java.util.ArrayList;
import dao.ICuentaDao;
import daoImpl.CuentaDaoImpl;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.Movimientos;
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
	
	public int Transferir(Movimientos Transferencia) {
		if (Transferencia == null) {
			System.out.println("La transferencia no puede ser nulo");
			return 0;
		}

		int res = iCuentaDao.Transferencia(Transferencia);
		
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
	
	public ArrayList<Movimientos> listarMovimientos(int page, int pageSize, int idCuenta) {
	    ArrayList<Movimientos> Movimientos = iCuentaDao.obtenerMovimientosPorCuenta(page, pageSize, idCuenta);

	    if (Movimientos == null || Movimientos.isEmpty()) {
	        System.out.println("No hay Movimientos.");
	        return new ArrayList<>();
	    }

	    return Movimientos;
	}
	
	public int getTotalMovimientosCount(int idCuenta) {
        return iCuentaDao.getTotalMovimientosCount(idCuenta);
    }
	
}
