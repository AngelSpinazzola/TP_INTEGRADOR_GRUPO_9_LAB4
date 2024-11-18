package negocio;

import java.util.ArrayList;
import entidad.Provincia;

public interface IProvinciaNegocio {
	ArrayList<Provincia> listarProvincias();
	public Provincia obtenerProvinciaPorId(int id);
}
