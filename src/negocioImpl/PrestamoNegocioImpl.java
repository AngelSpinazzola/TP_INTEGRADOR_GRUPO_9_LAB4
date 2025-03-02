package negocioImpl;

import java.util.ArrayList;
import dao.IPrestamoDao;
import daoImpl.PrestamoDaoImpl;
import entidad.Prestamo;
import negocio.IPrestamoNegocio;

public class PrestamoNegocioImpl implements IPrestamoNegocio{
	IPrestamoDao iPrestamoDao = new PrestamoDaoImpl();
	
	@Override
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize) {
		ArrayList<Prestamo> prestamos = iPrestamoDao.getPrestamosPorCliente(dniCliente , page, pageSize);
		
		return prestamos;
	}
	
	@Override
	public int getTotalPrestamosCount(int dniCliente) {
	    return iPrestamoDao.getTotalPrestamosCount(dniCliente); 
	}
	
	@Override
	public int calcularTotalPaginas(int dniCliente, int pageSize) {
	    int totalPrestamos = getTotalPrestamosCount(dniCliente); 
	    return (int) Math.ceil((double) totalPrestamos / pageSize);
	}
	
	 @Override
	    public boolean solicitarPrestamo(Prestamo prestamo) {
	        return iPrestamoDao.solicitarPrestamo(prestamo);
	    }
	    
	    @Override
	    public boolean aprobarPrestamo(int idPrestamo) {
	        return iPrestamoDao.aprobarPrestamo(idPrestamo);
	    }
	    
	    @Override
	    public boolean rechazarPrestamo(int idPrestamo) {
	        return iPrestamoDao.rechazarPrestamo(idPrestamo);
	    }

   
}