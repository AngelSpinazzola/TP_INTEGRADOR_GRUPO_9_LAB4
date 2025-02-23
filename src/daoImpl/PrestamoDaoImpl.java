package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.IPrestamoDao;
import entidad.Prestamo;

public class PrestamoDaoImpl implements IPrestamoDao {

	@Override
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente, int page, int pageSize) {
		ArrayList<Prestamo> prestamos = new ArrayList<>();

		int offset = (page - 1) * pageSize;

		String query = "SELECT " + "    p.IDPrestamo, p.IDTipoPrestamo, p.MontoPedido, p.ImporteAPagar, "
				+ "    p.Cuotas, p.Fecha, p.Estado, tp.Tipo, tp.TNA " + "FROM prestamos p "
				+ "INNER JOIN clientes c ON c.DNI = p.DNICliente "
				+ "INNER JOIN tipo_prestamos tp ON tp.IDTipoPrestamo = p.IDTipoPrestamo " + "WHERE p.DNICliente = ? "
				+ "LIMIT ? OFFSET ?";

		try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, dniCliente);
			ps.setInt(2, pageSize);
			ps.setInt(3, offset);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setIdPrestamo(rs.getInt("IDPrestamo"));
				prestamo.setIdTipoPrestamo(rs.getInt("IDTipoPrestamo"));
				prestamo.setMontoAPagar(rs.getFloat("ImporteAPagar"));
				prestamo.setMontoPedido(rs.getFloat("MontoPedido"));
				prestamo.setCuotas(rs.getInt("Cuotas"));
				prestamo.setFecha(rs.getDate("Fecha"));
				prestamo.setEstado(rs.getInt("Estado"));
				prestamo.setIdTipoPrestamo(rs.getInt("IDTipoPrestamo"));
				prestamo.setNombreTipoPrestamo(rs.getString("Tipo"));
				prestamo.setTna(rs.getFloat("TNA"));

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
	    public boolean insertarPrestamo(Prestamo prestamo) {
	        String query = "INSERT INTO prestamos (DNICliente, IDTipoPrestamo, MontoPedido, ImporteAPagar, Cuotas, Fecha, Estado) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	        try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, prestamo.getDniCliente());
	            ps.setInt(2, prestamo.getIdTipoPrestamo());
	            ps.setFloat(3, prestamo.getMontoPedido());
	            ps.setFloat(4, prestamo.getMontoAPagar());
	            ps.setInt(5, prestamo.getCuotas());
	            ps.setDate(6, new Date(prestamo.getFecha().getTime()));
	            ps.setInt(7, prestamo.getEstado()); // 0 = Pendiente, 1 = Aprobado, 2 = Rechazado
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public boolean actualizarEstadoPrestamo(int idPrestamo, int nuevoEstado) {
	        String query = "UPDATE prestamos SET Estado = ? WHERE IDPrestamo = ?";
	        try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, nuevoEstado);
	            ps.setInt(2, idPrestamo);
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public boolean pagarCuotaPrestamo(int idPrestamo, float monto, int numeroCuota) {
	        String query = "INSERT INTO pagos_prestamos (IDPrestamo, Monto, NumeroCuota, FechaPago) "
	                + "VALUES (?, ?, ?, NOW())";
	        try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, idPrestamo);
	            ps.setFloat(2, monto);
	            ps.setInt(3, numeroCuota);
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

}
