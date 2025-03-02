package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Prestamo;
import entidad.TipoPrestamo;
import negocio.IPrestamoNegocio;
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
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 5;
        HttpSession MiSession = request.getSession(false);
		
		Cliente usuario = new Cliente();
	    int dniCliente = usuario.getDni();
	    
        if (dniCliente!=0 ) {
            List<Prestamo> prestamos = prestamoNegocio.getPrestamosPorCliente(dniCliente, page, pageSize);
            for (Prestamo p : prestamos) {
                out.println("ID: " + p.getIdPrestamo() + " - Monto: " + p.getMontoPedido());
            }
        }
        out.flush();
    }

    // SOLICITAR PR�STAMO
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	int dniCliente = Integer.parseInt(request.getParameter("dni"));
        int cuotas = Integer.parseInt(request.getParameter("cuotas"));
        int idTipoPrestamo = Integer.parseInt(request.getParameter("idTipoPrestamo"));
        int idPrestamo = Integer.parseInt(request.getParameter("idpresatmo"));
		float montoPedido = parseFloatSafe(request.getParameter("MontoPedido"));;		
		float montoAPagar = parseFloatSafe(request.getParameter("ImporteAPagar"));
		String fecha =request.getParameter("fecha");
		
		
		Prestamo prestamo=new Prestamo();
		prestamo.setIdPrestamo(idPrestamo);
		prestamo.setIdTipoPrestamo(idTipoPrestamo);
		prestamo.setDniCliente(dniCliente);
		prestamo.setMontoPedido(montoPedido);
		prestamo.setMontoAPagar(montoAPagar);
		prestamo.setCuotas(cuotas);
		prestamo.setFecha(Date.valueOf(fecha));
		prestamo.setEstado(1);
        boolean resultado = prestamoNegocio.solicitarPrestamo(prestamo);
        
        response.setContentType("text/plain");
        response.getWriter().write(resultado ? "Solicitud exitosa" : "Error en la solicitud");
    }

// APROBAR PR�STAMO
protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
        boolean resultado = prestamoNegocio.aprobarPrestamo(idPrestamo);
        
        response.setContentType("text/plain");
        response.getWriter().write(resultado ? "Prestamo aprobado" : "Error al aprobar");
    }

// RECHAZAR PR�STAMO
protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
        boolean resultado = prestamoNegocio.rechazarPrestamo(idPrestamo);
        
        response.setContentType("text/plain");
        response.getWriter().write(resultado ? "Prestamo rechazado" : "Error al rechazar");
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
