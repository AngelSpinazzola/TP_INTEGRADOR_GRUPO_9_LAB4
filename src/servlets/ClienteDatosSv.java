package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Prestamo;
import negocio.IClienteNegocio;
import negocio.ICuentaNegocio;
import negocio.IPrestamoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/ClienteDatosSv")
public class ClienteDatosSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();
	private IPrestamoNegocio iPrestamoNegocio = new PrestamoNegocioImpl();
	private ICuentaNegocio iCuentaNegocio = new CuentaNegocioImpl();
    
    public ClienteDatosSv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	    String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");
        
		HttpSession MiSession = request.getSession(false);
		
		Cliente usuario = new Cliente();
		
		if (MiSession != null) {
            // Obtener el objeto Cliente de la sesión
			usuario = (Cliente) MiSession.getAttribute("usuario");
            if (usuario != null) {
                response.getWriter().println("Usuario logueado: " + usuario.getNombre());
            } else {
                response.getWriter().println("No hay usuario en la sesión.");
            }
        } else {
            response.getWriter().println("No hay sesión activa.");
        }
		
	    int dniCliente = usuario.getDni();
	   	    

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 3;
	    
        ArrayList<Prestamo> prestamos = iPrestamoNegocio.getPrestamosPorCliente(dniCliente, page, pageSize);
	    
	    int totalPrestamos = iPrestamoNegocio.getTotalPrestamosCount(dniCliente);
        int totalPaginas = (int) Math.ceil((double) totalPrestamos / pageSize);
        
	    ArrayList<Cuenta> cuentas = iCuentaNegocio.getCuentasDelCliente(dniCliente);

	    request.setAttribute("cliente", usuario);
	    request.setAttribute("prestamos", prestamos);
	    request.setAttribute("cuentas", cuentas); 
	    request.setAttribute("totalPrestamos", totalPrestamos);
	    request.setAttribute("totalPaginas", totalPaginas);
        request.setAttribute("paginaActual", page);


	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/ClienteDatos.jsp");
	    dispatcher.forward(request, response);
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
