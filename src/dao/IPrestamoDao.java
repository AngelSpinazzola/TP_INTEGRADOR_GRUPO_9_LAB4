package dao;

import java.util.ArrayList;
import entidad.Prestamo;

public interface IPrestamoDao {
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente);
}
