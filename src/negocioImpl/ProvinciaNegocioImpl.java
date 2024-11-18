package negocioImpl;

import java.util.ArrayList;

import dao.IProvinciaDao;
import daoImpl.ProvinciaDaoImpl;
import entidad.Provincia;
import negocio.IProvinciaNegocio;

public class ProvinciaNegocioImpl implements IProvinciaNegocio{
	private IProvinciaDao iProvinciaDao;
	
	public ProvinciaNegocioImpl() {
		this.iProvinciaDao = new ProvinciaDaoImpl();	
	}
	
	@Override
	public ArrayList<Provincia> listarProvincias() {
		ArrayList<Provincia> listaProvincias = iProvinciaDao.listarProvincias();
		return listaProvincias;
	}

	@Override
	public Provincia obtenerProvinciaPorId(int id) {
		Provincia provincia = iProvinciaDao.obtenerProvinciaPorId(id);
		return provincia;
	}
}
