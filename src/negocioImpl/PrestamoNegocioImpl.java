package negocioImpl;

import java.util.ArrayList;
import dao.IPrestamoDao;
import daoImpl.PrestamoDaoImpl;
import entidad.Prestamo;
import negocio.IPrestamoNegocio;

public class PrestamoNegocioImpl implements IPrestamoNegocio{
	IPrestamoDao iPrestamoDao = new PrestamoDaoImpl();
	
	@Override
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente) {
		ArrayList<Prestamo> prestamos = iPrestamoDao.getPrestamosPorCliente(dniCliente);
		
		return prestamos;
	}
}
