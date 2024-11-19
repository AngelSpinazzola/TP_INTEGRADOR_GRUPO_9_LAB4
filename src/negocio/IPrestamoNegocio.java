package negocio;

import java.util.ArrayList;
import entidad.Prestamo;

public interface IPrestamoNegocio {
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize);
	public int getTotalPrestamosCount(int dniCliente);
	public int calcularTotalPaginas(int dniCliente, int pageSize);
}
