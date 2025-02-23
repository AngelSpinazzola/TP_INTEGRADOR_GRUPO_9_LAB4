package dao;

import java.util.ArrayList;
import entidad.Prestamo;

public interface IPrestamoDao {
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize);
	public int getTotalPrestamosCount(int dniCliente);
	public int calcularTotalPaginas(int dniCliente, int pageSize);
	boolean pagarCuotaPrestamo(int idPrestamo, float monto, int numeroCuota);
	boolean actualizarEstadoPrestamo(int idPrestamo, int nuevoEstado);
	boolean insertarPrestamo(Prestamo prestamo);
}
