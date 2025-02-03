package entidad;

public class Usuario {

	private int id;
	private String nombreUsuario;
	private String password;
	private int estado;
	private int tipoUsu;

	public Usuario() {
	}

	public Usuario(String nombreUsuario, String contraseña , int tipo, int estado) {
		this.nombreUsuario = nombreUsuario;
		this.password = contraseña;
		this.tipoUsu = tipo;
		this.estado = estado;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public int getTipo() {
		return tipoUsu;
	}
	
	public void setTipo(int tipo) {
		this.tipoUsu = tipo;
	}
	
}