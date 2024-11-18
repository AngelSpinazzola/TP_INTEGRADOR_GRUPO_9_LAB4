package negocioImpl;

import java.util.ArrayList;

import dao.ILocalidadDao;
import daoImpl.LocalidadDaoImpl;
import entidad.Localidad;
import negocio.ILocalidadNegocio;

public class LocalidadNegocioImpl implements ILocalidadNegocio{
	private ILocalidadDao iLocalidadDao;
	
	public LocalidadNegocioImpl() {
		this.iLocalidadDao = new LocalidadDaoImpl();
	}
	
	@Override
	public ArrayList<Localidad> listarLocalidades() {
		ArrayList<Localidad> listaLocalidades = iLocalidadDao.listarLocalidades();
		return listaLocalidades;
	}

	@Override
	public Localidad obtenerLocalidadPorId(int id) {
		Localidad localidad = iLocalidadDao.obtenerLocalidadPorId(id);
		return localidad;
	}

}
