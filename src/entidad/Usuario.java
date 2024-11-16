package entidad;

public class Usuario {

	private int id;
	private final String nombreUsuario;
	private static String password = "123";
	private final TipoUsuario tipo;
	private boolean activo;

	public Usuario() {
		this.nombreUsuario = "user";
		this.tipo = TipoUsuario.cliente;
		this.activo = true;
	}

	public Usuario(String nombreUsuario, TipoUsuario tipo, boolean activo) {
		this.nombreUsuario = nombreUsuario;
		this.tipo = tipo;
		this.activo = activo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public static String getPassword() {
		return password;
	}

	public String getPass() {
		return password;
	}
	
	public static void setPassword(String password) {
		Usuario.password = password;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public TipoUsuario getTipo() {
		return tipo;
	}

}