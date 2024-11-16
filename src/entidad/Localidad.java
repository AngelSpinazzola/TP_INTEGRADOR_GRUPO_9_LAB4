package entidad;

public class Localidad {


	private int IDLocalidad;
	private String Nombre;
	private int IDProvincia;
	
	public Localidad(){
		
	}
	public Localidad(int idLocalidad, String nombre, int idProvincia){
		this.IDLocalidad = idLocalidad;
		this.Nombre = nombre;
		this.IDProvincia = idProvincia;
	}
	
	
	public int getIDLocalidad() {
		return IDLocalidad;
	}
	public void setIDLocalidad(int iDLocalidad) {
		IDLocalidad = iDLocalidad;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public int getIDProvincia() {
		return IDProvincia;
	}
	public void setIDProvincia(int iDProvincia) {
		IDProvincia = iDProvincia;
	}
	
	
	
	@Override
	public String toString() {
		return "Localidad [IDLocalidad=" + IDLocalidad + ", Nombre=" + Nombre + ", IDProvincia=" + IDProvincia + "]";
	}
		
	
	
}
