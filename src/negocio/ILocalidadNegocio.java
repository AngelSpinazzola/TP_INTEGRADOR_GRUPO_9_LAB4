package negocio;

import java.util.ArrayList;
import entidad.Localidad;

public interface ILocalidadNegocio {
	ArrayList<Localidad> listarLocalidades();
	public Localidad obtenerLocalidadPorId(int id);
}
