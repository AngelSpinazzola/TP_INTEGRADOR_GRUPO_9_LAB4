package entidad;

import java.sql.Date;

public class Prestamo extends TipoPrestamo{
	private int idPrestamo;
	private int idCuenta;
	private float montoPedido;
	private float montoAPagar;
	private int cuotas;
	private Date fecha;
	private int estado;
	
	public Prestamo() {
		super();
	}

	public Prestamo(int idPrestamo, int idCuenta, float montoPedido, float montoAPagar, int cuotas, Date fecha, int estado, TipoPrestamo tipoPrestamo) {
		super();
		this.idPrestamo = idPrestamo;
		this.idCuenta = idCuenta;
		this.montoPedido = montoPedido;
		this.montoAPagar = montoAPagar;
		this.cuotas = cuotas;
		this.fecha = fecha;
		this.estado = estado;
	}

	public int getIdPrestamo() {
		return idPrestamo;
	}

	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}


	public int getIdCuenta() {
		return idCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}

	public float getMontoPedido() {
		return montoPedido;
	}

	public void setMontoPedido(float montoPedido) {
		this.montoPedido = montoPedido;
	}

	public float getMontoAPagar() {
		return montoAPagar;
	}

	public void setMontoAPagar(float montoAPagar) {
		this.montoAPagar = montoAPagar;
	}

	public int getCuotas() {
		return cuotas;
	}

	public void setCuotas(int cuotas) {
		this.cuotas = cuotas;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
