package negocioImpl;

import java.sql.Date;
import java.util.ArrayList;
import dao.IMovimientosDao;
import entidad.Movimientos;
import negocio.IMovimientoNegocio;

public class MovimientosNegocioImpl implements IMovimientoNegocio {
private IMovimientosDao iMovimientosDao;
public ArrayList<Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin){	
ArrayList<Movimientos> movimientos= iMovimientosDao.listarMovimientos(fechaInicio, fechaFin);
if(movimientos== null || movimientos.isEmpty()) {
 System.out.println("No hay Movimientos activos.");
return new ArrayList<>();
}
return movimientos;		
    }
}