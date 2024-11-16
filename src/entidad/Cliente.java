package entidad;

public class Cliente {

	
	private	int DNI;
	private String CUIL;
	private String Nombre;
	private String Apellido;
	private String Sexo;
	private String Nacionalidad;
	private String FechaNacimiento;
	private int IDDireccion;
	private String Email;
	private int IDUsuario;
	
	private String direccion;
	private String telefono;
	


	public Cliente() {
		
	}
	
	
	
	
	public Cliente(int dNI, String cUIL, String nombre, String apellido, String sexo, String nacionalidad,
			String fechaNacimiento, int iDDireccion, String email, int iDUsuario, String direccion, String telefono) {
		super();
		DNI = dNI;
		CUIL = cUIL;
		Nombre = nombre;
		Apellido = apellido;
		Sexo = sexo;
		Nacionalidad = nacionalidad;
		FechaNacimiento = fechaNacimiento;
		IDDireccion = iDDireccion;
		Email = email;
		IDUsuario = iDUsuario;
		this.direccion = direccion;
		this.telefono = telefono;
	}




	public int getDNI() {
		return DNI;
	}
	public void setDNI(int dNI) {
		DNI = dNI;
	}
	public String getCUIL() {
		return CUIL;
	}
	public void setCUIL(String cUIL) {
		CUIL = cUIL;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getApellido() {
		return Apellido;
	}
	public void setApellido(String apellido) {
		Apellido = apellido;
	}
	public String getSexo() {
		return Sexo;
	}
	public void setSexo(String sexo) {
		Sexo = sexo;
	}
	public String getNacionalidad() {
		return Nacionalidad;
	}
	public void setNacionalidad(String nacionalidad) {
		Nacionalidad = nacionalidad;
	}
	public String getFechaNacimiento() {
		return FechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		FechaNacimiento = fechaNacimiento;
	}
	public int getIDDireccion() {
		return IDDireccion;
	}
	public void setIDDireccion(int iDDireccion) {
		IDDireccion = iDDireccion;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getIDUsuario() {
		return IDUsuario;
	}
	public void setIDUsuario(int iDUsuario) {
		IDUsuario = iDUsuario;
	}
	
	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	
}
