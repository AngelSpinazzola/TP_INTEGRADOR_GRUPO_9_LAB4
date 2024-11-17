package daoImpl;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import entidad.Provincia;
import entidad.Cliente;
import entidad.Cuentas;
import entidad.Localidad;
import entidad.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;


public class AdminDaoImpl {	
	
	private String queryProvincia = "select * from provincias";
	private String queryLocalidad = "select * from localidades";
	private String queryCuentas = "select  C.IDCuenta, C.DNICliente, CONCAT(CL.Nombre, ' ', CL.Apellido) as 'Nombre y Apellido', c.ESTADO, (select count(distinct C.DNICliente)) as 'cuentas' from Cuentas as C inner join Clientes as CL on C.DNICliente = CL.DNI group by C.DNICliente"; 
	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "root";
	private String dbName = "tpintegradorlaboratorio4";
	
	
	
	public ArrayList<Provincia> cargarDDLProvincias(){		

		ArrayList<Provincia> Lprovincias = new ArrayList<Provincia>();		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;				
		try {
			
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(queryProvincia);

			while (rs.next()) {
				
				Provincia provincia  = new Provincia();
				provincia.setIDProvincia(rs.getInt("IDProvincia"));
				provincia.setNombre(rs.getString("Nombre"));
				Lprovincias.add(provincia);					
			}
			cn.close();			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return Lprovincias;
	}	

	
	public ArrayList<Localidad> CargarDDLLocalidades(){
		

		ArrayList<Localidad> LLocalidades = new ArrayList<Localidad>();		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;				
		try {
			
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(queryLocalidad);

			while (rs.next()) {
				
				Localidad localidad  = new Localidad();
				localidad.setIDLocalidad(rs.getInt("IDLocalidad"));
				localidad.setNombre(rs.getString("Nombre"));
				LLocalidades.add(localidad);					
			}
			cn.close();			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return LLocalidades;

	} 
	
	
	public int cargarUsuario(Usuario usu) {	
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int filas = 0;
		Connection cn = null;
		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			
			String qry = "insert into usuarios (Usuario, Contrasenia, TipoUsuario, Estado) values( '"+usu.getNombreUsuario()+ "','" + usu.getPass()+  "', 2, 1 )";
//			String qry = " insert into usuarios (Usuario, Contrasenia, TipoUsuario, Estado) values( '"+"UsuarioHardCode"+"'  , '"+"PassHardCode"+"' , 2, 1) ";

			filas = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
		
		
	}
	
	public int cargarDireccion(Localidad loc) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int filas = 0;
		Connection cn = null;
		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			
			String qry = " insert into DIRECCIONES(IDLocalidad, CodigoPostal, Calle,Numero) values('"+loc.getIDLocalidad()+ "', 1111, 1111, 123) ";
						
			filas = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
		
		
	}
	
	public int obtenerUltimoIdUsuario() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;
		int id = 0;

		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();

			ResultSet rs = st.executeQuery("SELECT IDUsuario FROM usuarios ORDER BY IDUsuario DESC LIMIT 1");

			while (rs.next()) {
				id = rs.getInt("IDUsuario");
				cn.close();
			}

			return id ;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return id;
		}	
		
	}
	public int obtenerUltimoIdDireccion() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;
		int id = 0;

		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();

			ResultSet rs = st.executeQuery("select IDDireccion from direcciones order by IDDireccion desc limit 1");

			while (rs.next()) {
				id = rs.getInt("IDDireccion");
				cn.close();
			}

			return id ;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return id;
		}	
		
	}
	
	public int cargarCliente(Cliente cliente, Localidad loc, Usuario usu) {
		
		int filas = 0;
		
		filas = this.cargarUsuario(usu);
		filas = this.cargarDireccion(loc);	
		int idDireccion = this.obtenerUltimoIdDireccion();
		int idUsuario = this.obtenerUltimoIdUsuario();
				
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		Connection cn = null;
		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			
			String qry = " insert into clientes (DNI,CUIL,Nombre,Apellido, Sexo, Nacionalidad, FechaNacimiento, IDDireccion, Email,IDUsuario) values( '"+ cliente.getDNI() +"' , '11-111111-11' , '"+cliente.getNombre()+"' , '"+cliente.getApellido()+"' , '"+cliente.getSexo()+"' , '"+cliente.getNacionalidad()+"' , '"+cliente.getFechaNacimiento()+"', '"+idDireccion+"' , '"+cliente.getEmail()+"' , '"+idUsuario+"'  )"  ;
			filas = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
		
	}
	
	
	
	
	public ArrayList<Cuentas> ObtenerListaCuentas(){
		
		ArrayList<Cuentas> LCuentas = new ArrayList<Cuentas>();
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;				
		try {
			
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(queryCuentas);

			while (rs.next()) {						
				
				Cuentas cuenta = new Cuentas();
				cuenta.setIDCuenta(rs.getInt("IDCuenta"));
				cuenta.setDNICliente(rs.getInt("DNICliente"));
				cuenta.setNombreApelido(rs.getString("Nombre y Apellido"));
				
//				cuenta.setESTADO(rs.getBoolean("ESTADO"));
				
				if(rs.getBoolean("ESTADO") == true) {
					cuenta.setSestado("Activo");
				}else {
					cuenta.setSestado("Baja");
				}
				
				cuenta.setCuentas(rs.getInt("cuentas"));
				LCuentas.add(cuenta);
			}
			cn.close();			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return LCuentas;	
		
	}
	
}