package negocioImpl;

import java.sql.Date;
import java.util.ArrayList;
import dao.IMovimientosDao;
import entidad.Movimientos;
import negocio.IMovimientoNegocio;

public class MovimientosNegocioImpl implements IMovimientoNegocio {
private IMovimientosDao iMovimientosDao;

@Override
public ArrayList<Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin, int page, int pageSize) {
	return iMovimientosDao.listarMovimientos(fechaInicio, fechaFin, page, pageSize);
}
@Override
public int getTotalMovimientosCount(Date fechaInicio, Date fechaFin) {
	return iMovimientosDao.getTotalMovimientosCount(fechaInicio, fechaFin);	
}
}