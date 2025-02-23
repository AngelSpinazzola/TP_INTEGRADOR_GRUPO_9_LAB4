package daoImpl;

import java.sql.Connection;
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


}
