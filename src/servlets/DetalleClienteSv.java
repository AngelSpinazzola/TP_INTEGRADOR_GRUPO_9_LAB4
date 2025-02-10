package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.Prestamo;
import negocio.IClienteNegocio;
import negocio.ICuentaNegocio;
import negocio.IPrestamoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/DetalleClienteSv")
public class DetalleClienteSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();
	private IPrestamoNegocio iPrestamoNegocio = new PrestamoNegocioImpl();
	private ICuentaNegocio iCuentaNegocio = new CuentaNegocioImpl();

	public DetalleClienteSv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String dniCliente = request.getParameter("dni");
		String action = request.getParameter("action");
		request.setAttribute("action", action);
	    
	    if (dniCliente == null || dniCliente.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'dni' es obligatorio.");
	        return;
	    }
	    
	    int dni = -1;
	    dni = Integer.parseInt(dniCliente);
	    
	    String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 3;
	    
	    
	    Cliente cliente = iClienteNegocio.getDetalleCliente(dni);
	    ArrayList<Prestamo> prestamos = iPrestamoNegocio.getPrestamosPorCliente(dni, page, pageSize);
	    
	    int totalPrestamos = iPrestamoNegocio.getTotalPrestamosCount(dni);
        int totalPaginas = (int) Math.ceil((double) totalPrestamos / pageSize);
        
	    ArrayList<Cuenta> cuentas = iCuentaNegocio.getCuentasDelCliente(dni);

	    request.setAttribute("cliente", cliente);
	    request.setAttribute("prestamos", prestamos);
	    request.setAttribute("cuentas", cuentas); 
	    request.setAttribute("totalPrestamos", totalPrestamos);
	    request.setAttribute("totalPaginas", totalPaginas);
        request.setAttribute("paginaActual", page);

        if ("detalleCliente".equals(action)) {
            request.getRequestDispatcher("AdminDetalleCliente.jsp").forward(request, response);
        } else if ("editarCliente".equals(action)) {
            request.getRequestDispatcher("CargarDesplegablesSv").forward(request, response);
        } else {
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
