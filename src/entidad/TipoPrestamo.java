package entidad;

public class TipoPrestamo {
	private int idTipoPrestamo;
	private String nombreTipoPrestamo;
	private float tna; // (Tasa Nominal Anual) representa el porcentaje de inter�s que se aplica seg�n el tipo de pr�stamo
	
	public TipoPrestamo() {
		
	}
	
	public TipoPrestamo(int idTipoPrestamo, String nombreTipoPrestamo, float tna) {
		super(); // Revisar
		this.idTipoPrestamo = idTipoPrestamo;
		this.nombreTipoPrestamo = nombreTipoPrestamo;
		this.tna = tna;
	}

	public int getIdTipoPrestamo() {
		return idTipoPrestamo;
	}

	public void setIdTipoPrestamo(int idTipoPrestamo) {
		this.idTipoPrestamo = idTipoPrestamo;
	}

	public String getNombreTipoPrestamo() {
		return nombreTipoPrestamo;
	}

	public void setNombreTipoPrestamo(String nombreTipoPrestamo) {
		this.nombreTipoPrestamo = nombreTipoPrestamo;
	}

	public float getTna() {
		return tna;
	}

	public void setTna(float tna) {
		this.tna = tna;
	}
}
