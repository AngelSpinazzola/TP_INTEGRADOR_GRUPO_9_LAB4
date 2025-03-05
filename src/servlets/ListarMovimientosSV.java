package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import daoImpl.MovimientosDaoimpl;
import entidad.Movimientos;

@WebServlet("/ListarMovimientosSV")
public class ListarMovimientosSV extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public ListarMovimientosSV() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String fechaInicioStr = request.getParameter("fechaInicio");
        String fechaFinStr = request.getParameter("fechaFin");
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        if (fechaInicioStr == null || fechaFinStr == null) {
            request.setAttribute("error", "Debe seleccionar un rango de fechas válido.");
            RequestDispatcher rd = request.getRequestDispatcher("AdminReportes.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            Date fechaInicio = Date.valueOf(fechaInicioStr);
            Date fechaFin = Date.valueOf(fechaFinStr);
            int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
            int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 5;

            MovimientosDaoimpl dao = new MovimientosDaoimpl();
            ArrayList<Movimientos> movimientos = dao.listarMovimientos(fechaInicio, fechaFin, page, pageSize);
            int totalMovimientos = dao.getTotalMovimientosCount(fechaInicio, fechaFin);
            int totalPages = (int) Math.ceil((double) totalMovimientos / pageSize);

            request.setAttribute("movimientos", movimientos);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher("AdminReportes.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Formato de fecha incorrecto.");
            RequestDispatcher rd = request.getRequestDispatcher("AdminReportes.jsp");
            rd.forward(request, response);
        }
    }
}
