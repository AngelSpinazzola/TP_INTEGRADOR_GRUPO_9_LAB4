package dao;

import java.util.ArrayList;
import entidad.Localidad;

public interface ILocalidadDao {
	public ArrayList<Localidad> listarLocalidades();
	public Localidad obtenerLocalidadPorId(int id);
	ArrayList<Localidad> listarLocalidadesXProvincia();
}
