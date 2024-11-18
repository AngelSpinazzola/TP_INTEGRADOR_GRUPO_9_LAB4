package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.IPrestamoDao;
import entidad.Prestamo;

public class PrestamoDaoImpl implements IPrestamoDao {
	
	@Override
	public ArrayList<Prestamo> getPrestamosPorCliente(int dniCliente) {
		ArrayList<Prestamo> prestamos = new ArrayList<>();
		
		String query = "SELECT " + "    p.IDPrestamo, p.IDTipoPrestamo, p.MontoPedido, p.ImporteAPagar, "
				+ "    p.Cuotas, p.Fecha, p.Estado, tp.Tipo, tp.TNA " + "FROM prestamos p "
				+ "INNER JOIN clientes c ON c.DNI = p.DNICliente "
				+ "INNER JOIN tipo_prestamos tp ON tp.IDTipoPrestamo = p.IDTipoPrestamo " + "WHERE p.DNICliente = ?";

		try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, dniCliente);
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
}
