package negocioImpl;

import java.util.ArrayList;

import daoImpl.AdminDaoImpl;
import entidad.Cliente;
import entidad.Cuentas;
import entidad.Localidad;
import entidad.Provincia;
import entidad.Usuario;
import negocio.IAdminNegocio;

public class AdminNegocioImpl implements IAdminNegocio{
	
	@Override
	public ArrayList<Provincia> CargarDDLProv() {

		AdminDaoImpl  adi = new AdminDaoImpl();					
 		ArrayList <Provincia> lProvincias = adi.cargarDDLProvincias(); 		
				
		return lProvincias;
	}

	@Override
	public ArrayList<Localidad> CargarDDLLoc() {

		AdminDaoImpl  adi = new AdminDaoImpl();			
		ArrayList <Localidad> lLocalidad = adi.CargarDDLLocalidades();
		
		return lLocalidad; 
		
	}


	public int cargarCliente(Cliente cliente,  Localidad loc, Usuario usu) {
		
		
		AdminDaoImpl adi = new AdminDaoImpl();
		int filas = 0;
		filas =  adi.cargarCliente(cliente, loc, usu);
		
		return filas;
	}

	/*
	public ArrayList<Cuentas> ObtenerListaCuentas() {

		AdminDaoImpl adi = new AdminDaoImpl();
		ArrayList<Cuentas> lcuentas = new ArrayList<Cuentas>();
		lcuentas = adi.ObtenerListaCuentas();		
		
		return lcuentas;
	}	
	*/
	
	
}
