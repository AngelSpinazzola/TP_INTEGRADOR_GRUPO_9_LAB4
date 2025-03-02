package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Cliente;
import entidad.Prestamo;
import negocio.IClienteNegocio;
import negocio.IPrestamoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class ListarPrestamosSV
 */
@WebServlet("/ListarPrestamosSV")
public class ListarPrestamosSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();
	private IPrestamoNegocio iPrestamoNegocio = new PrestamoNegocioImpl();
	
    public ListarPrestamosSV() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dniCliente = request.getParameter("dni");
		String action = request.getParameter("action");
		request.setAttribute("action", action);
		int dni = -1;
		if (dniCliente != null && !dniCliente.isEmpty() && dniCliente.matches("\\d+")) {
		    dni = Integer.parseInt(dniCliente);
		} else {
		    request.setAttribute("error", "DNI inv�lido o no proporcionado.");
		    request.getRequestDispatcher("/AdminPrestamosActivos.jsp").forward(request, response);
		    return; 
		}
	    String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 3;

	    Cliente cliente = iClienteNegocio.getDetalleCliente(dni);
	    ArrayList<Prestamo> prestamos = iPrestamoNegocio.getPrestamosPorCliente(dni, page, pageSize);
	    
	    int totalPrestamos = iPrestamoNegocio.getTotalPrestamosCount(dni);
        int totalPaginas = (int) Math.ceil((double) totalPrestamos / pageSize);
		
        request.setAttribute("cliente", cliente);
        request.setAttribute("prestamos", prestamos);
        request.setAttribute("totalPrestamos", totalPrestamos);
        request.setAttribute("listaPrestamos",totalPrestamos);
        request.setAttribute("totalPages", totalPaginas);
        request.setAttribute("currentPage", page);

        if ("ListarPrestamos".equals(action)) {  
        request.getRequestDispatcher("/AdminPrestamosActivos.jsp").forward(request, response);
		
	}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
