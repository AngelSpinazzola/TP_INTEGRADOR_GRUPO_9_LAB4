package entidad;

public class TipoMovimiento {
	
	private int IDTipoMovimiento;
	private String Descripcion;
	
	public TipoMovimiento() {
	}
	
	public TipoMovimiento(int IDTipo, String Descr) {
		super();
		this.IDTipoMovimiento = IDTipo;
		this.Descripcion = Descr;
	}
	
	public int getIDTipoMovimiento() {
		return IDTipoMovimiento;
	}
	public void setIDTipoMovimiento(int iDTipoMovimiento) {
		IDTipoMovimiento = iDTipoMovimiento;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

}
