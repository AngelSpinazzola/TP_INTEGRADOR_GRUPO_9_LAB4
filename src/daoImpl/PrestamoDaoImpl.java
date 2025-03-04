package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.logging.Logger;

import dao.IPrestamoDao;
import entidad.Prestamo;
import sun.security.timestamp.TSRequest;

public class PrestamoDaoImpl implements IPrestamoDao {

	@Override
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize) {
	    ArrayList<Prestamo> prestamos = new ArrayList<>();
	    
	    if (page < 1) page = 1;
	    int offset = (page - 1) * pageSize;

	    String query = "{CALL ObtenerPrestamosPorCliente(?, ?, ?)}";

	    try (Connection conn = Conexion.getConnection();
	         CallableStatement cs = conn.prepareCall(query)) {
	        
	        cs.setInt(1, dniCliente);
	        cs.setInt(2, offset);
	        cs.setInt(3, pageSize);
	        
	        ResultSet rs = cs.executeQuery();

	        while (rs.next()) {
	            Prestamo prestamo = new Prestamo();
	            prestamo.setIdPrestamo(rs.getInt("IDPrestamo"));
	            prestamo.setIdCuenta(rs.getInt("IDCuenta"));
	            prestamo.setMontoAPagar(rs.getFloat("ImporteAPagar"));
	            prestamo.setMontoPedido(rs.getFloat("MontoPedido"));
	            prestamo.setCuotas(rs.getInt("Cuotas"));
	            prestamo.setFecha(rs.getDate("Fecha"));
	            prestamo.setEstado(rs.getInt("Estado"));

	            prestamos.add(prestamo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return prestamos;
	}

	@Override
	public int getTotalPrestamosCount(int dniCliente) {
		String query = "SELECT COUNT(*) FROM prestamos\r\n" + "WHERE DNICliente = ?";

		int totalPrestamos = 0;

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query)) {

			statement.setInt(1, dniCliente);

			try (ResultSet rs = statement.executeQuery()) {
				if (rs.next()) {
					totalPrestamos = rs.getInt(1); 
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalPrestamos;
	}

	@Override
	public int calcularTotalPaginas(int dniCliente, int pageSize) {
	    int totalPrestamos = getTotalPrestamosCount(dniCliente); 
	    return (int) Math.ceil((double) totalPrestamos / pageSize); 
	}

	@Override
	public boolean aprobarPrestamo(int idPrestamo) {
	    String query = "{CALL AprobarPrestamo(?)}";
	
	    try (Connection conn = Conexion.getConnection();
	         CallableStatement cs = conn.prepareCall(query)) {
	        
	        cs.setInt(1, idPrestamo);
	        return cs.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
		
	@Override
	public boolean solicitarPrestamo(Prestamo prestamo) {
	    String query = "{CALL SolicitarPrestamo(?, ?, ?, ?, ?)}";
	    	
	    try (Connection conn = Conexion.getConnection();
	         CallableStatement cs = conn.prepareCall(query)) {
	        
	        cs.setInt(1, prestamo.getIdCuenta());
	        cs.setFloat(2, prestamo.getMontoPedido());
	        cs.setFloat(3, prestamo.getMontoAPagar());
	        cs.setInt(4, prestamo.getCuotas());
	        cs.setDate(5, new java.sql.Date(prestamo.getFecha().getTime()));
	
	        return cs.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean rechazarPrestamo(int idPrestamo) {
	    String query = "UPDATE prestamos SET Estado = 3 WHERE IDPrestamo = ?";

	    try (Connection conn = Conexion.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setInt(1, idPrestamo);
	        
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
