package entidad;

public class Provincia {
	
	private int IDProvincia;
	private String Nombre;
	

	public Provincia() {
		
	}
	public Provincia(int id, String nombre) {
		this.IDProvincia = id;
		this.Nombre = nombre;
	}
	
	
	public int getIDProvincia() {
		return IDProvincia;
	}
	public void setIDProvincia(int iDProvincia) {
		IDProvincia = iDProvincia;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	
	
	@Override
	public String toString() {
		return "Provincia [IDProvincia=" + IDProvincia + ", Nombre=" + Nombre + "]";
	}

}
