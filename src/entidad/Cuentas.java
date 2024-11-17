package entidad;

public class Cuentas {

	private int	IDCuenta;
	private int DNICliente ;
	private String FechaCreacion;
	private int NumeroCuenta;
	private String CBU;
	private float Saldo;
	private int IDTipoCuenta;
	private boolean ESTADO;
	private String nombreApelido; // revisar
	private int cuentas ;// revisar
	private String Sestado;
	
	public Cuentas(){
		
	}	
	
	public Cuentas(int iDCuenta, int dNICliente, String fechaCreacion, int numeroCuenta, String cBU, float saldo,
			int iDTipoCuenta, boolean eSTADO, String nombreApelido, int cuentas, String sEstado) {
		super();
		IDCuenta = iDCuenta;
		DNICliente = dNICliente;
		FechaCreacion = fechaCreacion;
		NumeroCuenta = numeroCuenta;
		CBU = cBU;
		Saldo = saldo;
		IDTipoCuenta = iDTipoCuenta;
		ESTADO = eSTADO;
		this.nombreApelido = nombreApelido;
		this.cuentas = cuentas;
		this.Sestado = sEstado;
	}
	
	public int getIDCuenta() {
		return IDCuenta;
	}
	public void setIDCuenta(int iDCuenta) {
		IDCuenta = iDCuenta;
	}
	public int getDNICliente() {
		return DNICliente;
	}
	public void setDNICliente(int dNICliente) {
		DNICliente = dNICliente;
	}
	public String getFechaCreacion() {
		return FechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		FechaCreacion = fechaCreacion;
	}
	public int getNumeroCuenta() {
		return NumeroCuenta;
	}
	public void setNumeroCuenta(int numeroCuenta) {
		NumeroCuenta = numeroCuenta;
	}
	public String getCBU() {
		return CBU;
	}
	public void setCBU(String cBU) {
		CBU = cBU;
	}
	public float getSaldo() {
		return Saldo;
	}
	public void setSaldo(float saldo) {
		Saldo = saldo;
	}
	public int getIDTipoCuenta() {
		return IDTipoCuenta;
	}
	public void setIDTipoCuenta(int iDTipoCuenta) {
		IDTipoCuenta = iDTipoCuenta;
	}
	public boolean isESTADO() {
		return ESTADO;
	}
	public void setESTADO(boolean eSTADO) {
		ESTADO = eSTADO;
	}
	public String getNombreApelido() {
		return nombreApelido;
	}
	public void setNombreApelido(String nombreApelido) {
		this.nombreApelido = nombreApelido;
	}

	public int getCuentas() {
		return cuentas;
	}

	public void setCuentas(int cuentas) {
		this.cuentas = cuentas;
	}

	public String getSestado() {
		return Sestado;
	}

	public void setSestado(String sestado) {
		Sestado = sestado;
	}
	



	
	
}
