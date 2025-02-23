package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dao.ICuentaDao;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.TipoCuenta;

public  class CuentaDaoImpl implements ICuentaDao {

	@Override
	public ArrayList<Cuenta> getCuentasDelCliente(int dni) {
		ArrayList<Cuenta> cuentas = new ArrayList<>();

		String query = "\r\n" + 
				"SELECT cu.IDCuenta as idCuenta, cu.CBU as cbu, cu.FechaCreacion as fechaCreacion,  tc.IDTipoCuenta as idTipoCuenta, tc.Tipo as nombreTipoCuenta, cu.Saldo as saldo\r\n" + 
				"FROM cuentas cu\r\n" + 
				"INNER JOIN tipo_cuentas tc ON tc.IDTipoCuenta = cu.IDTipoCuenta \r\n" + 
				"INNER JOIN clientes c ON c.DNI = cu.DNICliente\r\n" + 
				"WHERE cu.DNICliente = ? AND cu.ESTADO = 1";

		try (Connection conn = Conexion.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, dni);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TipoCuenta tipoCuenta = new TipoCuenta(rs.getInt("idTipoCuenta"), rs.getString("nombreTipoCuenta"));
				Cuenta cuenta = new Cuenta();

				cuenta.setIdCuenta(rs.getInt("idCuenta"));
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
	
	public boolean Transferencia(int cuentaOrigen, int cuentaDestino, double monto) {
		
        System.out.println("monto: " + monto);
        System.out.println("cuenta origen: " + cuentaOrigen);
        System.out.println("cuenta destino: " + cuentaDestino);
		
        try (Connection conn = Conexion.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL SP_TransferirDinero(?, ?, ?)}")) {
            
            stmt.setInt(1, cuentaOrigen);
            stmt.setInt(2, cuentaDestino);
            stmt.setDouble(3, monto);

            int resultado = stmt.executeUpdate();
            return resultado > 0;
        } catch (SQLException e) {
            System.out.println("Error en la base de datos: " + e.getMessage());
        }
		return false;
    }
	@Override

	public boolean agregarCuenta(Cuenta cuenta, Cliente cliente){
	    try(Connection cn = Conexion.getConnection();){
	    	
	    	String sql ="{CALL SP_AgregarCuentas(?, ?, ?, ?, ?)}";
	    	
	    try (CallableStatement stmt = cn.prepareCall(sql)) {
 	        stmt.setInt(1, cliente.getDni());
	        stmt.setDate(2, new java.sql.Date(cuenta.getFechaCreacion().getTime()));
	        stmt.setString(3, cuenta.getCbu());
	        stmt.setFloat(4, cuenta.getSaldo());
	        stmt.setInt(5, cuenta.getTipoCuenta().getIdTipoCuenta());
	        
	        System.out.println(cuenta.getTipoCuenta().getIdTipoCuenta());
	        System.out.println(cliente.getDni());
	        
	        int filasInsertadas = stmt.executeUpdate();
	        return filasInsertadas > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    	}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public int getProximoID(){
		
		int nextId = 0;
		
	    try(Connection cn = Conexion.getConnection();){
	    	
	    String sql = "SHOW TABLE STATUS LIKE 'cuentas'";
	    	
	    try (PreparedStatement ps = cn.prepareStatement(sql);
	    	    ResultSet rs = ps.executeQuery();) {

	    	if(rs.next()){
	            nextId = rs.getInt("Auto_increment");
	        }
	    } catch(Exception e) {
	        System.out.println("Error: " + e.getMessage());
	      }
	    }catch(Exception e) {
	        System.out.println("Error: " + e.getMessage());
	      }
		return nextId;
	}
	public boolean EliminarCuenta(int iDCuenta) {
		try (Connection conn = Conexion.getConnection();
	             CallableStatement stmt = conn.prepareCall("{CALL SP_EliminarCuenta(?)}")) {
	            
	            stmt.setInt(1, iDCuenta);
		        int filasInsertadas = stmt.executeUpdate();
		        return filasInsertadas > 0;
		       
	        } catch (SQLException e) {
	        	e.printStackTrace();
				return false;
	        }
	}

	@Override
	public boolean ValidarCBU(String cuentaDestino) {
	    String query = "SELECT COUNT(*) FROM cuentas WHERE CBU = ? AND ESTADO = 1";
	    boolean existe = false;

	    try (Connection conn = Conexion.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, cuentaDestino);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            existe = rs.getInt(1) > 0; // Si COUNT(*) > 0, significa que el CBU existe
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return existe;
	}
}    


