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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 5;

        ArrayList<Cliente> listaClientes = iClienteNegocio.listarClientes(page, pageSize);

        int totalClientes = iClienteNegocio.getTotalClientesCount();  
        int totalPages = (int) Math.ceil((double) totalClientes / pageSize);  

        request.setAttribute("listaClientes", listaClientes);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("/AdminGestionClientes.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

