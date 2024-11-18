package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidad.Cliente;
import negocio.IClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

@WebServlet("/DetalleClienteSv")
public class DetalleClienteSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();


	public DetalleClienteSv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String dniCliente = request.getParameter("dni");
	    
	    if (dniCliente == null || dniCliente.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'dni' es obligatorio.");
	        return;
	    }
	    
	    int dni = -1;
	    dni = Integer.parseInt(dniCliente);
	    
	    Cliente cliente = iClienteNegocio.getDetalleCliente(dni);
	    
	    request.setAttribute("cliente", cliente);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminDetalleCliente.jsp");
	    dispatcher.forward(request, response);
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
