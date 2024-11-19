package negocio;

import java.util.ArrayList;
import entidad.Prestamo;

public interface IPrestamoNegocio {
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente);
}
