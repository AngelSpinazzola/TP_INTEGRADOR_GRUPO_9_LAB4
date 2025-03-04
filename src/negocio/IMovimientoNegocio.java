package negocio;
import java.sql.Date;
import java.util.ArrayList;
import entidad.Movimientos;
public interface IMovimientoNegocio {
public ArrayList <Movimientos> listarMovimientos(Date fechaInicio, Date fechaFin);
}
