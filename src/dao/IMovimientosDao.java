package dao;
import java.sql.Date;
import java.util.ArrayList;
import entidad.Movimientos; ;
public interface IMovimientosDao {

public ArrayList<Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin);

}
