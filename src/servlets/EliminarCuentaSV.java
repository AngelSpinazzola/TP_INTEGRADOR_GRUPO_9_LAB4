package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.IClienteNegocio;
import negocio.ICuentaNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;

/**
 * Servlet implementation class EliminarCuentaSV
 */
@WebServlet("/EliminarCuentaSV")
public class EliminarCuentaSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
    public EliminarCuentaSV() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCuenta = parseIntSafe(request.getParameter("idCuenta"));
    	HttpSession session = request.getSession();
        boolean res = cuentaNegocioImpl.EliminarCuenta(idCuenta);
        
        if(res == true) {
        	session.setAttribute("success", "Cuenta eliminada correctamente");
       	 System.out.println("Registro editado correctamente");
        }
        else {
        	session.setAttribute("error", "Error al eliminar la cuenta");
       	 System.out.println("error al editar el registro");
        }
        response.sendRedirect("ListarClientesSv");
        
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
