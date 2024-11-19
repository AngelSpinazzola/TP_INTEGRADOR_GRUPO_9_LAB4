package entidad;

import java.sql.Date;

public class Cuenta{
	private int idCuenta;
	private Date fechaCreacion;
	private long numeroCuenta;
	private String cbu;
	private float saldo;
	private boolean estadoCuenta;
	private TipoCuenta tipoCuenta;
	
	public Cuenta() {
		
	}
	
	public Cuenta(int idCuenta, Date fechaCreacion, long numeroCuenta, String cbu, float saldo, TipoCuenta tipoCuenta, boolean estadoCuenta) {
        this.idCuenta = idCuenta;
        this.fechaCreacion = fechaCreacion;
        this.numeroCuenta = numeroCuenta;
        this.cbu = cbu;
        this.saldo = saldo;
        this.tipoCuenta = tipoCuenta;  
        this.estadoCuenta = estadoCuenta;
    }

	public int getIdCuenta() {
		return idCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public long getNumeroCuenta() {
		return numeroCuenta;
	}

	public void setNumeroCuenta(long numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}

	public String getCbu() {
		return cbu;
	}

	public void setCbu(String cbu) {
		this.cbu = cbu;
	}

	public float getSaldo() {
		return saldo;
	}

	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}

	public boolean isEstadoCuenta() {
		return estadoCuenta;
	}

	public void setEstadoCuenta(boolean estadoCuenta) {
		this.estadoCuenta = estadoCuenta;
	}
	
	public TipoCuenta getTipoCuenta() {
        return tipoCuenta;
    }

    public void setTipoCuenta(TipoCuenta tipoCuenta) {
        this.tipoCuenta = tipoCuenta;
    }
}
