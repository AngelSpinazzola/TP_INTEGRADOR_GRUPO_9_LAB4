package entidad;

public class Direccion {
	private int idDireccion;
	private int numero;
	private String calle;
	private String codigoPostal;
	private Provincia provincia;
	private Localidad localidad;

	public Direccion() {

	}

	public Direccion(int idDireccion, int numero, String calle, String codigoPostal, Provincia provincia,
			Localidad localidad) {
		super();
		this.idDireccion = idDireccion;
		this.numero = numero;
		this.calle = calle;
		this.codigoPostal = codigoPostal;
		this.provincia = provincia;
		this.localidad = localidad;
	}

	public int getIdDireccion() {
		return idDireccion;
	}

	public void setIdDireccion(int idDireccion) {
		this.idDireccion = idDireccion;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
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

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	public Localidad getLocalidad() {
		return localidad;
	}

	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
}