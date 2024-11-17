package negocio;

import java.util.ArrayList;

import entidad.Cliente;
import entidad.Cuentas;
import entidad.Localidad;
import entidad.Provincia;
import entidad.Usuario;

public interface IAdminNegocio {

	ArrayList<Provincia> CargarDDLProv();
	ArrayList<Localidad> CargarDDLLoc();
	int cargarCliente(Cliente cliente, Localidad loc, Usuario usu);
	ArrayList<Cuentas> ObtenerListaCuentas();
}
