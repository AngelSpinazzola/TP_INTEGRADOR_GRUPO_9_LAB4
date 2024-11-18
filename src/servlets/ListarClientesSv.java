package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidad.Cliente;
import negocio.IClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

@WebServlet("/ListarClientesSv")
public class ListarClientesSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();

	public ListarClientesSv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Cliente> listaClientes = iClienteNegocio.listarClientes();
		request.setAttribute("listaClientes", listaClientes);
		request.getRequestDispatcher("/AdminGestionClientes.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
