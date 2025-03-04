package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Movimientos;
import entidad.Prestamo;
import entidad.TipoPrestamo;
import negocio.IPrestamoNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/PrestamosSV")
public class PrestamosSV extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IPrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();

    public PrestamosSV() {
        super();
    }

    // LISTAR PR�STAMOS POR CLIENTE
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 5;
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
	    
        PrestamoNegocioImpl PrestamoNegocioImpl = new PrestamoNegocioImpl();

        ArrayList<Prestamo> listaPrestamos = PrestamoNegocioImpl.getPrestamosPorCliente(dniCliente, page, pageSize);

	    int totalPrestamos = PrestamoNegocioImpl.getTotalPrestamosCount(dniCliente);
        int totalPaginas = (int) Math.ceil((double) totalPrestamos / pageSize);

        request.setAttribute("listaPrestamos", listaPrestamos);
        request.setAttribute("totalPages", totalPaginas);
        request.setAttribute("currentPage", page);


        request.getRequestDispatcher("Prestamos.jsp").forward(request, response);

    }

    // SOLICITAR PR�STAMO
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
    	
    	int dniCliente = Integer.parseInt(request.getParameter("dni"));
    	int idCuenta = Integer.parseInt(request.getParameter("CuentaOrigen"));
        int cuotas = Integer.parseInt(request.getParameter("cantMeses"));
		float montoPedido = parseFloatSafe(request.getParameter("MontoPedido"));	
		float montoAPagar = parseFloatSafe(request.getParameter("TotalPagar"));
		String fecha = request.getParameter("FechaCreacion");
		
		System.out.println(idCuenta);
		System.out.println(cuotas);
		System.out.println(montoPedido);
		System.out.println(montoAPagar);
		System.out.println(fecha);
		
		Prestamo prestamo = new Prestamo();

		if (fecha != null && !fecha.trim().isEmpty()) {
		    try {
		        java.sql.Date fechaSQL = java.sql.Date.valueOf(fecha.trim());
		        prestamo.setFecha(fechaSQL);
		    } catch (IllegalArgumentException e) {
		        System.out.println("Error: Formato de fecha incorrecto - " + fecha);
		        response.getWriter().write("Error en la fecha ingresada.");
		        return;
		    }
		} else {
		    System.out.println("Error: Fecha no recibida.");
		    response.getWriter().write("Fecha no válida.");
		    return;
		}
		
		prestamo.setIdCuenta(idCuenta);
		prestamo.setMontoPedido(montoPedido);
		prestamo.setMontoAPagar(montoAPagar);
		prestamo.setCuotas(cuotas);
		prestamo.setEstado(0);
        boolean res = prestamoNegocio.solicitarPrestamo(prestamo);
        
        if(res == true) {
        	session.setAttribute("success", "Prestamo solicitado correctamente");
       	 	System.out.println("Prestamo solicitado correctamente");
        }
        else {
        	session.setAttribute("error", "Error al solicitar prestamo");
       	 	System.out.println("Error al solicitar prestamo");
        }
         response.sendRedirect("CargarDesplegablesSv?dni= " + dniCliente + "&action=getPrestamos");
    }
    
private float parseFloatSafe(String parameter) {
    	if (parameter == null || parameter.isEmpty()) return 0.0f;
    	try {
    		return Float.parseFloat(parameter);
    	} catch (NumberFormatException e) {
    		return 0.0f;
    	}
    }
    
}
