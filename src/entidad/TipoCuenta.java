package entidad;

public class TipoCuenta {
	private int idTipoCuenta;
	private String tipo;
	
	public TipoCuenta(int idTipoCuenta, String tipo) {
		this.idTipoCuenta = idTipoCuenta;
		this.tipo = tipo;
	}

	public int getIdTipoCuenta() {
		return idTipoCuenta;
	}

	public void setIdTipoCuenta(int idTipoCuenta) {
		this.idTipoCuenta = idTipoCuenta;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}
