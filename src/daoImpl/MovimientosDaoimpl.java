package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IMovimientosDao;
import entidad.Movimientos;
import entidad.TipoMovimiento;

public class MovimientosDaoimpl implements IMovimientosDao {
	
@Override
public ArrayList<Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin, int page, int pageSize) {
    String query = "SELECT m.IDMovimiento, m.Fecha, m.Detalle, m.Importe, " +
                   "m.IDCuentaEmisor, m.IDCuentaReceptor, tm.IDTipoMovimiento, tm.Nombre " +
                   "FROM movimientos m " +
                   "JOIN tipo_movimientos tm ON m.IDTipoMovimiento = tm.IDTipoMovimiento " +
                   "WHERE m.Fecha BETWEEN ? AND ? " +
                   "LIMIT ? OFFSET ?"; 

    ArrayList<Movimientos> ListaMovimientos = new ArrayList<>();
    try (Connection cn = Conexion.getConnection();
         PreparedStatement ps = cn.prepareStatement(query)) {
        
        ps.setDate(1, fechaInicio);
        ps.setDate(2, fechaFin);
        ps.setInt(3, pageSize);
        ps.setInt(4, (page - 1) * pageSize);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Movimientos mov = new Movimientos();
                mov.setIDMovimiento(rs.getInt("IDMovimiento"));
                mov.setFecha(rs.getDate("Fecha"));
                mov.setDetalle(rs.getString("Detalle"));
                mov.setImporte(rs.getDouble("Importe"));
                mov.setIDCuentaEnvia(rs.getInt("IDCuentaEmisor"));
                mov.setIDCuentaRecibe(rs.getString("IDCuentaReceptor"));

                TipoMovimiento tipo = new TipoMovimiento();
                tipo.setIDTipoMovimiento(rs.getInt("IDTipoMovimiento"));
                tipo.setDescripcion(rs.getString("Nombre"));
                mov.setTIpoMov(tipo);

                ListaMovimientos.add(mov);
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return ListaMovimientos;
}

@Override
public int getTotalMovimientosCount(Date fechaInicio, Date fechaFin) {
    String query = "SELECT COUNT(*) AS total FROM movimientos WHERE Fecha BETWEEN ? AND ?";
    int totalMovimientos = 0;
    
    try (Connection cn = Conexion.getConnection();
         PreparedStatement ps = cn.prepareStatement(query)) {
        
        ps.setDate(1, fechaInicio);
        ps.setDate(2, fechaFin);
        
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalMovimientos = rs.getInt("total");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return totalMovimientos;
}
}