package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.AdminDaoImpl;
import entidad.Cliente;
import entidad.Localidad;
import entidad.Provincia;
import entidad.Usuario;
import negocioImpl.AdminNegocioImpl;

/**
 * Servlet implementation class ServletAdmAlta
 */
@WebServlet("/ServletAdmAlta")
public class ServletAdmAlta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdmAlta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

			if(request.getParameter("param") != null) {	// si se hizo click en el boton "Nuevo cliente"
			
			
			AdminNegocioImpl  ani = new AdminNegocioImpl();					
	 		ArrayList <Provincia> lProvincias = ani.CargarDDLProv();
	 		ArrayList <Localidad> lLocalidades = ani.CargarDDLLoc();
	 		
	 		request.setAttribute("ListaProv", lProvincias); 
	 		request.setAttribute("ListaLoc", lLocalidades); 
	 		
	 		// Redirige al .jsp "Alta cliente" con los DropDown cargados desde la bdd
	 		RequestDispatcher rd = request.getRequestDispatcher("/AdminAltaCliente.jsp");
	 		rd.forward(request, response);		

			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int filas = 0;
		
		Cliente cliente = new Cliente();
		//Provincia provincia = new Provincia();
		Localidad localidad = new Localidad();
		Usuario usuario = new Usuario();
		
		AdminNegocioImpl ani = new AdminNegocioImpl();
		
		if(request.getParameter("btnDarAlta") != null) {	// si se hizo click en "dar de alta"
			
			
			cliente.setDNI(Integer.parseInt(request.getParameter("dni")));
			cliente.setCUIL("11-1111111-1");	// valor hardcode
			cliente.setNombre(request.getParameter("nombre"));
			cliente.setApellido(request.getParameter("apellido"));
			cliente.setSexo(request.getParameter("sexo"));
			cliente.setNacionalidad(request.getParameter("nacionalidad"));
			cliente.setFechaNacimiento(request.getParameter("fechaNacimiento"));
//			cliente.setIDDireccion();
			cliente.setEmail(request.getParameter("email"));
//			cliente.setIDUsuario();
			
			//provincia.setNombre(request.getParameter());
			localidad.setIDLocalidad(Integer.parseInt( request.getParameter("localidad")) );
		//	provincia.set
			
			
			
			filas = ani.cargarCliente(cliente, localidad, usuario);
		
			
			request.setAttribute("cantFilas", filas);
			RequestDispatcher rd = request.getRequestDispatcher("/AdminAltaCliente.jsp");
			rd.forward(request, response);
			
			
		}
		
		
		
		
		
	}

}
