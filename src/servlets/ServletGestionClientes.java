package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Cuentas;
import negocioImpl.AdminNegocioImpl;

/**
 * Servlet implementation class ServletGestionClientes
 */
@WebServlet("/ServletGestionClientes")
public class ServletGestionClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGestionClientes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		if(request.getParameter("param") != null) {	// si se hizo click en el boton "Clientes"
			
			// logica para cargar el grid
			
			AdminNegocioImpl ani = new AdminNegocioImpl();
			ArrayList<Cuentas> lcuentas = ani.ObtenerListaCuentas();
		
			request.setAttribute("lcuentas", lcuentas);
		
	 		// Redirige al .jsp "AdminGestionClientes"
	 		RequestDispatcher rd = request.getRequestDispatcher("/AdminGestionClientes.jsp");
	 		rd.forward(request, response);		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
