package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Localidad;
import entidad.Provincia;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;

@WebServlet("/CargarDesplegablesSv")
public class CargarDesplegablesSv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CargarDesplegablesSv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		ProvinciaNegocioImpl provinciaNegocioImpl = new ProvinciaNegocioImpl();
		LocalidadNegocioImpl localidadNegocioImpl = new LocalidadNegocioImpl();

		ArrayList<Provincia> listaProvincias = provinciaNegocioImpl.listarProvincias();
		ArrayList<Localidad> listaLocalidades = localidadNegocioImpl.listarLocalidades();
		
		request.setAttribute("listaProvincias", listaProvincias);
        request.setAttribute("listaLocalidades", listaLocalidades);
        
        if ("agregarCliente".equals(action)) {
            request.getRequestDispatcher("AdminAltaCliente.jsp").forward(request, response);
            return;
        }

        if ("editarCliente".equals(action)) {
            request.getRequestDispatcher("AdminEditarCliente.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("Error.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
