package entidad;

public class Localidad {
	private int idLocalidad;
	private String nombre;
	
	public Localidad() {
		
	}
	
	public Localidad(int idLocalidad, String nombre){
		this.idLocalidad = idLocalidad;
		this.nombre = nombre;
	}
	
	public int getIdLocalidad() {
		return idLocalidad;
	}
	public void setIdLocalidad(int idLocalidad) {
		this.idLocalidad = idLocalidad;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
