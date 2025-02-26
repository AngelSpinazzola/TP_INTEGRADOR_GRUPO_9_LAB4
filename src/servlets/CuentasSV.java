package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;

import daoImpl.CuentaDaoImpl;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.TipoCuenta;
import negocio.IClienteNegocio;
import negocio.ICuentaNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;


@WebServlet("/CuentasSV")
public class CuentasSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ICuentaNegocio iCuentaNegocio = new CuentaNegocioImpl();
	private IClienteNegocio iClienteNegocio = new ClienteNegocioImpl();
    public CuentasSV() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
		try {
	        // Método para obtener parámetros seguros
	        int dniCliente = parseIntSafe(request.getParameter("dni"));
	        String fechaCreacion = request.getParameter("FechaCreacion");
	        String cbu = request.getParameter("CBU");
	        float saldo = parseFloatSafe(request.getParameter("Saldo"));
	        int idTipoCuenta = parseIntSafe(request.getParameter("IDTipoCuenta"));
	
	        // Validar que no haya valores inválidos
	        if (fechaCreacion == null || fechaCreacion.isEmpty() || cbu == null || cbu.isEmpty()) {
	            throw new IllegalArgumentException("Uno o más parámetros son inválidos.");
	        }
	
	        // Crear objetos
	        TipoCuenta tipoCuenta = new TipoCuenta();
	        tipoCuenta.setIdTipoCuenta(idTipoCuenta);
	
	        Cliente cliente = new Cliente();
	        cliente.setDni(dniCliente);
	
	        Cuenta nuevaCuenta = new Cuenta();
	        nuevaCuenta.setFechaCreacion(Date.valueOf(fechaCreacion));
	        nuevaCuenta.setCbu(cbu);
	        nuevaCuenta.setSaldo(saldo);
	        nuevaCuenta.setTipoCuenta(tipoCuenta);
	        nuevaCuenta.setEstadoCuenta(true);
	
	        // Guardar cuenta
	        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	        boolean res = cuentaNegocioImpl.agregarCuentas(nuevaCuenta, cliente);
	        
	        if(res == true) {

	        	session.setAttribute("success", "Cuenta creada con éxito");
	       	 	System.out.println("Registro editado correctamente");
	        }
	        else {
	        	session.setAttribute("error", "Error al crear la cuenta");
	       	 	System.out.println("error al editar el registro");
	        }
	         response.sendRedirect("ListarClientesSv");
	
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp?msg=No se pudo" + e.getMessage());
	    }
	}

	// Métodos para validar entradas seguras
	private int parseIntSafe(String param) {
	    if (param == null || param.isEmpty()) return 0; // Valor por defecto
	    try {
	        return Integer.parseInt(param);
	    } catch (NumberFormatException e) {
	        return 0; // Manejo de error
	    }
	}
	
	private float parseFloatSafe(String param) {
	    if (param == null || param.isEmpty()) return 0.0f;
	    try {
	        return Float.parseFloat(param);
	    } catch (NumberFormatException e) {
	        return 0.0f;
	    }
	}

}
