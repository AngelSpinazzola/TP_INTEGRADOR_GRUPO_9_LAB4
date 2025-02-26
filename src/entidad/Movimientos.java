package entidad;

import java.sql.Date;

public class Movimientos {

	private int IDMovimiento;
	private Date Fecha;
	private String Detalle;
	private double Importe;
	private int IDCuentaEnvia;
	private String IDCuentaRecibe;
	private TipoMovimiento TIpoMov;
	
	public Movimientos() {
	}
	
	public Movimientos(int iDMovimiento, Date fecha, String detalle, double importe, int iDCuentaEnvia,
			String iDCuentaRecibe, TipoMovimiento tIpoMov) {
		super();
		IDMovimiento = iDMovimiento;
		Fecha = fecha;
		Detalle = detalle;
		Importe = importe;
		IDCuentaEnvia = iDCuentaEnvia;
		IDCuentaRecibe = iDCuentaRecibe;
		TIpoMov = tIpoMov;
	}
	public int getIDMovimiento() {
		return IDMovimiento;
	}
	public void setIDMovimiento(int iDMovimiento) {
		IDMovimiento = iDMovimiento;
	}
	public Date getFecha() {
		return Fecha;
	}
	public void setFecha(Date fecha) {
		Fecha = fecha;
	}
	public String getDetalle() {
		return Detalle;
	}
	public void setDetalle(String detalle) {
		Detalle = detalle;
	}
	public double getImporte() {
		return Importe;
	}
	public void setImporte(double importe) {
		Importe = importe;
	}
	public int getIDCuentaEnvia() {
		return IDCuentaEnvia;
	}
	public void setIDCuentaEnvia(int iDCuentaEnvia) {
		IDCuentaEnvia = iDCuentaEnvia;
	}
	public String getIDCuentaRecibe() {
		return IDCuentaRecibe;
	}
	public void setIDCuentaRecibe(String cuentaDest) {
		IDCuentaRecibe = cuentaDest;
	}
	public TipoMovimiento getTIpoMov() {
		return TIpoMov;
	}
	public void setTIpoMov(TipoMovimiento tIpoMov) {
		TIpoMov = tIpoMov;
	}
	
	
	
}
