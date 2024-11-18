package excepciones;

public class ClienteNegocioException extends RuntimeException{

	public ClienteNegocioException(String message) {
		super(message);
	}

}