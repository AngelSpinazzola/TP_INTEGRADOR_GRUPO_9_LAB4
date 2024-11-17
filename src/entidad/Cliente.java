package entidad;

import java.sql.Date;
import java.util.ArrayList;

public class Cliente extends Usuario{
	private	int dni;
	private String cuil;
	private String nombre;
	private String apellido;
	private String sexo;
	private String nacionalidad;
	private String email;
	private Date fechaNacimiento;
	private int idDireccion;
	private int estado;
	private int cantidadCuentas;
	
	public Cliente() {
		
	}
	
	public Cliente(int dni, String cuil, String nombre, String apellido, String sexo, String nacionalidad, String email,
			Date fechaNacimiento, int idDireccion, int estado, int cantidadCuentas) {
		super();
		this.dni = dni;
		this.cuil = cuil;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.nacionalidad = nacionalidad;
		this.email = email;
		this.fechaNacimiento = fechaNacimiento;
		this.idDireccion = idDireccion;
		this.estado = estado;
		this.cantidadCuentas = cantidadCuentas;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getCuil() {
		return cuil;
	}

	public void setCuil(String cuil) {
		this.cuil = cuil;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public int getIdDireccion() {
		return idDireccion;
	}

	public void setIdDireccion(int idDireccion) {
		this.idDireccion = idDireccion;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public int getCantidadCuentas() {
		return cantidadCuentas;
	}

	public void setCantidadCuentas(int cantidadCuentas) {
		this.cantidadCuentas = cantidadCuentas;
	}
	
	
	
}
