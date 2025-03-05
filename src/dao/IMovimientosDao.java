package dao;
import java.sql.Date;
import java.util.ArrayList;
import entidad.Movimientos; ;
public interface IMovimientosDao {

ArrayList<Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin, int page, int pageSize);
int getTotalMovimientosCount(Date fechaInicio, Date fechaFin);
}
