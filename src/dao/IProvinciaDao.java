package dao;

import java.util.ArrayList;
import entidad.Provincia;

public interface IProvinciaDao {
	public ArrayList<Provincia> listarProvincias();
	public Provincia obtenerProvinciaPorId(int id);
}
