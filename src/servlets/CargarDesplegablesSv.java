package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Cuenta;
import entidad.Localidad;
import entidad.Provincia;
import negocio.IClienteNegocio;
import negocio.ICuentaNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
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
		int dni = parseIntSafe(request.getParameter("dni"));

		ProvinciaNegocioImpl provinciaNegocioImpl = new ProvinciaNegocioImpl();
		LocalidadNegocioImpl localidadNegocioImpl = new LocalidadNegocioImpl();
		ICuentaNegocio iCuentaNegocio = new CuentaNegocioImpl();

		ArrayList<Provincia> listaProvincias = provinciaNegocioImpl.listarProvincias();
		ArrayList<Localidad> listaLocalidades = localidadNegocioImpl.listarLocalidades();
		ArrayList<Cuenta> cuentas = iCuentaNegocio.getCuentasDelCliente(dni);
		
		request.setAttribute("listaProvincias", listaProvincias);
        request.setAttribute("listaLocalidades", listaLocalidades);
	    request.setAttribute("listaCuentas", cuentas); 
	    
	    System.out.println("Cuentas obtenidas:");
	    for (Cuenta cuenta : cuentas) {
	        System.out.println("ID: " + cuenta.getIdCuenta() + " - CBU: " + cuenta.getCbu());
	    }
        
        if ("agregarCliente".equals(action)) {
            request.getRequestDispatcher("AdminAltaCliente.jsp").forward(request, response);
            return;
        }

        else if ("editarCliente".equals(action)) {
            request.getRequestDispatcher("AdminEditarCliente.jsp").forward(request, response);
            return;
        }
        else if ("getCuentas".equals(action)) {
            request.getRequestDispatcher("ClienteTransferir.jsp").forward(request, response);
            return;
        }
        else if ("getCuentasMov".equals(action)) {
            request.getRequestDispatcher("ClienteMovimientos.jsp").forward(request, response);
            return;
        }
        else if("getPrestamos".equals(action)) {
        	 request.getRequestDispatcher("Prestamos.jsp").forward(request, response);
             return;
        }
        else if("getMisPrestamos".equals(action)) {
       	 request.getRequestDispatcher("MisPrestamos.jsp").forward(request, response);
            return;
       }
        else {
			
        	request.getRequestDispatcher("Error.jsp").forward(request, response);
		}
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private int parseIntSafe(String param) {
	    if (param == null || param.isEmpty()) return 0; // Valor por defecto
	    try {
	        return Integer.parseInt(param);
	    } catch (NumberFormatException e) {
	        return 0; // Manejo de error
	    }
	}
	
}
