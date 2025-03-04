package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
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

        System.out.println("Fecha Inicio: " + fechaInicioStr);
        System.out.println("Fecha Fin: " + fechaFinStr);

        if (fechaInicioStr == null || fechaFinStr == null) {
            request.setAttribute("error", "Debe seleccionar un rango de fechas válido.");
            RequestDispatcher rd = request.getRequestDispatcher("reportes.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            Date fechaInicio = Date.valueOf(fechaInicioStr);
            Date fechaFin = Date.valueOf(fechaFinStr);

            MovimientosDaoimpl dao = new MovimientosDaoimpl();
            List<Movimientos> movimientos = dao.listarMovimientos(fechaInicio, fechaFin);
            System.out.println("Movimientos encontrados: " + movimientos.size());

            request.setAttribute("movimientos", movimientos);
            RequestDispatcher rd = request.getRequestDispatcher("AdminReportes.jsp");
            rd.forward(request, response);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Formato de fecha incorrecto.");
            RequestDispatcher rd = request.getRequestDispatcher("AdminReportes.jsp");
            rd.forward(request, response);
        }
    }
}
