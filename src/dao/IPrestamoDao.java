package dao;

import java.util.ArrayList;
import entidad.Prestamo;

public interface IPrestamoDao {
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize);
	public int getTotalPrestamosCount(int dniCliente);
	public int calcularTotalPaginas(int dniCliente, int pageSize);
	public boolean aprobarPrestamo(int idPrestamo);
	public boolean solicitarPrestamo(Prestamo prestamo);
	public boolean rechazarPrestamo(int idPrestamo);	
}
