package entidad;

public class Direccion {
	private int idDireccion;
	private int numero;
	private int idLocalidad;
	private String calle;
	private String codigoPostal;
	
	public Direccion() {
		this.idLocalidad = 1; // 1 Por default, seria Bs As.
		this.codigoPostal = "Codigo postal Default";
		this.calle = "Calle Default";
		this.numero = 123;
	}
	
	public Direccion(int idLocalidad, String codigoPostal, String calle, int numero) {
		this.idLocalidad = idLocalidad;
		this.codigoPostal = codigoPostal;
		this.calle = calle;
		this.numero = numero;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public int getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(int idLocalidad) {
		this.idLocalidad = idLocalidad;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public int getIdDireccion() {
		return idDireccion;
	}
}
