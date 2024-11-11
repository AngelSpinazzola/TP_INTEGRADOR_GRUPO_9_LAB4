package entidad;

public enum TipoUsuario {
	admin(1), cliente(2);

	public final int codigo;

	private TipoUsuario(int codigo) {
		this.codigo = codigo;
	}

	public static TipoUsuario get(int codigo) {
		TipoUsuario tipo = null;
		switch (codigo) {
		case 1:
			tipo = admin;
			break;
		case 2:
			tipo = cliente;
			break;
		}
		return tipo;
	}
}
