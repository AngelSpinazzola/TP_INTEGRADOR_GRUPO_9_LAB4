package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entidad.Usuario;
import negocioImpl.UsuarioNegocioImpl;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletLogin() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		if (email == null || email.isEmpty() || pass == null || pass.isEmpty()) {
			request.setAttribute("error", "Por favor complete todos los campos");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}

		UsuarioNegocioImpl usuarioNegocioImpl = new UsuarioNegocioImpl();
		Usuario usuarioLogin = usuarioNegocioImpl.login(email, pass);

		if (usuarioLogin == null) {
			request.setAttribute("error", "Usuario o contraseña incorrectos");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("usuario", usuarioLogin);

		if (usuarioLogin.getTipo().codigo == 1) {
			response.sendRedirect("AdminPanel.jsp");
		} else if (usuarioLogin.getTipo().codigo == 2) {
			response.sendRedirect("ClientePanel.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}
}
