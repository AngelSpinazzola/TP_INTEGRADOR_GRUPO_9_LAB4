package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Movimientos;
import entidad.Cliente;
import entidad.Cuenta;
import negocioImpl.CuentaNegocioImpl;

/**
 * Servlet implementation class ClienteMovimientos
 */
@WebServlet("/ClienteMovimientos")
public class ClienteMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClienteMovimientos() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession MiSession = request.getSession(false);
		
		Cliente usuario = new Cliente();
		
		if (MiSession != null) {
            // Obtener el objeto Cliente de la sesión
			usuario = (Cliente) MiSession.getAttribute("usuario");
            if (usuario != null) {
            } else {
            	System.out.println("No hay usuario en la sesión.");
            }
        } else {
        	System.out.println("No hay sesión activa.");
        }
		
	    int dniCliente = usuario.getDni();
		
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
        
        int idCuenta = Integer.parseInt(request.getParameter("idCuenta"));
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 5;

        ArrayList<Movimientos> listaMovimientos = cuentaNegocioImpl.listarMovimientos(page, pageSize, idCuenta);
		ArrayList<Cuenta> cuentas = cuentaNegocioImpl.getCuentasDelCliente(dniCliente);

        int totalClientes = cuentaNegocioImpl.getTotalMovimientosCount(idCuenta);  
        int totalPages = (int) Math.ceil((double) totalClientes / pageSize);  

        request.setAttribute("listaMovimientos", listaMovimientos);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
	    request.setAttribute("listaCuentas", cuentas); 
	    request.setAttribute("idCuenta", idCuenta); 

        request.getRequestDispatcher("ClienteMovimientos.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
