package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Movimientos;
import negocioImpl.CuentaNegocioImpl;

@WebServlet("/TransferenciaSV")
public class TransferenciaSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TransferenciaSV() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession();
    	int res = 0;
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
        
		String cuentaOrig = request.getParameter("CuentaOrigen");
        String fecha = request.getParameter("FechaCreacion");
        String cuentaDestino = (request.getParameter("cuentaDestino"));
        String montoStr = request.getParameter("saldoCuentaOrigen");
    	int dni = parseIntSafe(request.getParameter("dni"));
		int cuentaOrigen = parseIntSafe(cuentaOrig);

        if (montoStr == null || montoStr.trim().isEmpty()) {
            // Manejar el error, redirigir o mostrar un mensaje
        	session.setAttribute("error", "Seleccione una cuenta para poder transferir dinero");
        	response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
            return;
        }
        
        double monto = Double.parseDouble(request.getParameter("monto"));
        double montoCuentaSeleccionada = Double.parseDouble(montoStr);
        
        if (monto > montoCuentaSeleccionada) {
        	session.setAttribute("error", "Saldo insuficiente, realice un prestamo si lo requiere");
        	response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
        	return;
        }
        if (cuentaNegocioImpl.ValidarCBU(cuentaDestino) == false) {
        	session.setAttribute("error", "La cuenta a la cual quiere transferir no existe");
        	response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
        	return;
        }
        
        Movimientos Transferencia = new Movimientos();
        Transferencia.setFecha(Date.valueOf(fecha));
        Transferencia.setIDCuentaEnvia(cuentaOrigen);
        Transferencia.setIDCuentaRecibe(cuentaDestino);
        Transferencia.setImporte(monto);
        
        res = cuentaNegocioImpl.Transferir(Transferencia);
        
        if(res > 0) {

        	session.setAttribute("success", "Transferencia realizada correctamente");
       	 	System.out.println("Transferencia realizada correctamente");
        }
        else {
        	session.setAttribute("error", "Error al realizar la transferencia");
       	 	System.out.println("error al realizar la transferencia");
        }
         response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
        
	}	
	private int parseIntSafe(String param) {
	    if (param == null || param.isEmpty()) return 0; // Valor por defecto
	    try {
	        return Integer.parseInt(param);
	    } catch (NumberFormatException e) {
	        return 0; // Manejo de error
	    }
	}
	
	private long parseLongSafe(String param) {
	    if (param == null || param.trim().isEmpty()) return 0L; // Valor por defecto
	    try {
	        return Long.parseLong(param);
	    } catch (NumberFormatException e) {
	        return 0L; // Manejo de error
	    }
	}
	
}
