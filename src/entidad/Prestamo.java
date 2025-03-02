package entidad;

import java.sql.Date;

public class Prestamo extends TipoPrestamo{
	private int idPrestamo;
	private int dniCliente;
	private float montoPedido;
	private float montoAPagar;
	private int cuotas;
	private Date fecha;
	private int estado;
	
	public Prestamo() {
		super();
	}

	public Prestamo(int idPrestamo, int dniCliente, float montoPedido, float montoAPagar, int cuotas, Date fecha, int estado, TipoPrestamo tipoPrestamo) {
		super();
		this.idPrestamo = idPrestamo;
		this.dniCliente = dniCliente;
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

	public int getDniCliente() {
		return dniCliente;
	}

	public void setDniCliente(int dniCliente) {
		this.dniCliente = dniCliente;
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
