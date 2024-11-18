package entidad;

public class Usuario {

	private int id;
	private String nombreUsuario;
	private String password = "123";
	private final TipoUsuario tipo;
	private int estado;

	public Usuario() {
		this.nombreUsuario = "user";
		this.tipo = TipoUsuario.cliente;
		this.estado = 1;
	}

	public Usuario(String nombreUsuario, TipoUsuario tipo, int estado) {
		this.nombreUsuario = nombreUsuario;
		this.tipo = tipo;
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

	public int getId() {
		return id;
	}

	public TipoUsuario getTipo() {
		return tipo;
	}

	

}