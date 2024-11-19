package negocioImpl;

import java.util.ArrayList;
import dao.ICuentaDao;
import daoImpl.CuentaDaoImpl;
import entidad.Cuenta;
import negocio.ICuentaNegocio;

public class CuentaNegocioImpl implements ICuentaNegocio{
	ICuentaDao iCuentaDao = new CuentaDaoImpl();
	
	@Override
	public ArrayList<Cuenta> getCuentasDelCliente(int dni) {
		ArrayList<Cuenta> cuentas = iCuentaDao.getCuentasDelCliente(dni);
		
		return cuentas;
	}
}
