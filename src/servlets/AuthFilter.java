package servlets;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Usuario;

@WebFilter("/*")
public class AuthFilter implements Filter {

	public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);

		// Verifica si existe una sesión
		Cliente usuario = (session != null) ? (Cliente) session.getAttribute("usuario") : null;
		String uri = req.getRequestURI();

		// Permite acceso sin autenticación a Home.jsp, Login.jsp, ServletLogin, Error.jsp y recursos estáticos
		if (uri.contains("Login.jsp") || uri.contains("ServletLogin")
				|| uri.contains("Error.jsp") || uri.contains("/Images/") || uri.contains("/Css/")) {
			chain.doFilter(request, response);
			return;
		}

		// Si el usuario es null (no autenticado), redirige a Login.jsp
		if (session == null || usuario == null) {
			res.sendRedirect("Login.jsp");
			return;
		}
		
		// Si el usuario es un administrador, redirige si intenta acceder a Home.jsp
        if (uri.contains("Home.jsp") && usuario.getUsuario().getTipo() == 1) {
            session.setAttribute("errorMsj", "Acceso no autorizado. Los administradores no pueden acceder a esta página.");
            res.sendRedirect("Error.jsp");
            return;
        }

		// Verifica el acceso a páginas de administrador
		if ((uri.contains("AdminPanel.jsp") || uri.contains("AdminGestionClientes.jsp")
				|| uri.contains("AdminAltaCliente.jsp") || uri.contains("AdminDetalleCliente.jsp")
				|| uri.contains("AdminEditarCliente.jsp") || uri.contains("AdminPrestamosActivos.jsp")
				|| uri.contains("AdminPrestamosRevision.jsp") || uri.contains("AdminResumenPrestamos.jsp"))
				&& usuario.getUsuario().getTipo() != 1) {
			session.setAttribute("errorMsj",
					"Acceso no autorizado. Solo administradores pueden acceder a esta página.");
			res.sendRedirect("Error.jsp");
			return;
		}

		// Verifica el acceso a páginas de cliente
		if ((uri.contains("ClientePanel.jsp") || uri.contains("ClienteDatos.jsp")
				|| uri.contains("ClienteMovimientos.jsp") || uri.contains("ClienteTransferir.jsp")
				|| uri.contains("MisPrestamos.jsp") || uri.contains("PagarCuotas.jsp") || uri.contains("Prestamos.jsp"))
				&& usuario.getUsuario().getTipo() != 2) {
			session.setAttribute("errorMsj", "Acceso no autorizado. Solo clientes pueden acceder a esta página.");
			res.sendRedirect("Error.jsp");
			return;
		}

		// Si está autenticado y autorizado, permite el acceso
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}
}
