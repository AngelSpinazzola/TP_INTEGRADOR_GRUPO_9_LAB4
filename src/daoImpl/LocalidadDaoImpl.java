package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.ILocalidadDao;
import entidad.Localidad;

public class LocalidadDaoImpl implements ILocalidadDao {
	
	@Override
	public ArrayList<Localidad> listarLocalidades(){
	    String query = "SELECT idLocalidad, nombre FROM localidades";
		ArrayList<Localidad> listaLocalidades = new ArrayList<>();	
		
	    try (Connection conexion = Conexion.getConnection();
		         PreparedStatement statement = conexion.prepareStatement(query);
		         ResultSet resultSet = statement.executeQuery()) {

		        while (resultSet.next()) {
		            Localidad localidad = new Localidad();
		            
		            localidad.setIdLocalidad(resultSet.getInt("idLocalidad"));
		            localidad.setNombre(resultSet.getString("nombre"));
		            listaLocalidades.add(localidad);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
	    
		return listaLocalidades;
	}
	
	@Override
	public Localidad obtenerLocalidadPorId(int id) {
		String query = "SESELECT idLocalidad, nombre FROM localidades WHERE idLocalidad = ?";
		Localidad localidad = null;

		try (Connection conexion = Conexion.getConnection();
			PreparedStatement statement = conexion.prepareStatement(query)) {
			statement.setInt(1, id);

			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					localidad = new Localidad();
					localidad.setIdLocalidad(resultSet.getInt("idLocalidad"));
					localidad.setNombre(resultSet.getString("nombre"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return localidad;
	}
}
