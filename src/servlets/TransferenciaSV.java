package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocioImpl.CuentaNegocioImpl;

/**
 * Servlet implementation class TransferenciaSV
 */
@WebServlet("/TransferenciaSV")
public class TransferenciaSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferenciaSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession();
    	boolean res = false;
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();

    	int dni = parseIntSafe(request.getParameter("dni"));
		int cuentaOrigen = parseIntSafe(request.getParameter("CuentaOrigen"));
		String CuentaDest = request.getParameter("CuentaOrigen");
        int cuentaDestino = parseIntSafe(request.getParameter("cuentaDestino"));
        double monto = Double.parseDouble(request.getParameter("monto"));
        double montoCuentaSeleccionada = Double.parseDouble(request.getParameter("saldoCuentaOrigen"));
        
        if (monto > montoCuentaSeleccionada) {
        	session.setAttribute("error", "Saldo insuficiente, realice un prestamo si lo requiere");
        	response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
        	return;
        }
        if (cuentaNegocioImpl.ValidarCBU(CuentaDest) == false) {
        	session.setAttribute("error", "La cuenta a la cual quiere transferir no existe");
        	response.sendRedirect("CargarDesplegablesSv?dni=" + dni + "&action=getCuentas");
        	return;
        }
               
        System.out.println("monto: " + monto);
        System.out.println("cuenta origen: " + cuentaOrigen);
        System.out.println("cuenta destino: " + cuentaDestino);
        
        res = cuentaNegocioImpl.Transferir(cuentaOrigen, cuentaDestino, monto);
        
        if(res == true) {

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

}
