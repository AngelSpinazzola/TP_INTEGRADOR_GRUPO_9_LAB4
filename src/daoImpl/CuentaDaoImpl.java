package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.ICuentaDao;
import entidad.Cuenta;
import entidad.TipoCuenta;

public class CuentaDaoImpl implements ICuentaDao {

	@Override
	public ArrayList<Cuenta> getCuentasDelCliente(int dni) {
		ArrayList<Cuenta> cuentas = new ArrayList<>();

		String query = "\r\n" + 
				"SELECT cu.NumeroCuenta as numeroCuenta, cu.CBU as cbu, cu.FechaCreacion as fechaCreacion,  tc.IDTipoCuenta as idTipoCuenta, tc.Tipo as nombreTipoCuenta, cu.Saldo as saldo\r\n" + 
				"FROM cuentas cu\r\n" + 
				"INNER JOIN tipo_cuentas tc ON tc.IDTipoCuenta = cu.IDTipoCuenta \r\n" + 
				"INNER JOIN clientes c ON c.DNI = cu.DNICliente\r\n" + 
				"WHERE cu.DNICliente = ?";

		try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, dni);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TipoCuenta tipoCuenta = new TipoCuenta(rs.getInt("idTipoCuenta"), rs.getString("nombreTipoCuenta"));
				Cuenta cuenta = new Cuenta();

				cuenta.setNumeroCuenta(rs.getInt("numeroCuenta"));
				cuenta.setCbu(rs.getString("cbu"));
				cuenta.setFechaCreacion(rs.getDate("fechaCreacion"));
				cuenta.setSaldo(rs.getFloat("saldo"));
				cuenta.setTipoCuenta(tipoCuenta);
				
				cuentas.add(cuenta);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cuentas;
	}
}
