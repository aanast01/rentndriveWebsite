

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String model = request.getParameter("model");
		String country = request.getParameter("country");
		int noofpeople = Integer.parseInt(request.getParameter("noofpeople"));
		String city = request.getParameter("city");
		String startingdate = request.getParameter("startingdate");
		String finishingdate = request.getParameter("finishingdate");	
		String transmition = request.getParameter("transmition");
		String fuel = request.getParameter("fuel");
		int year = Integer.parseInt(request.getParameter("year"));

		request.setAttribute("model", model);
		request.setAttribute("country", country);
		request.setAttribute("noofpeople", noofpeople);
		request.setAttribute("city", city);
		request.setAttribute("startingdate", startingdate);
		request.setAttribute("finishingdate", finishingdate);
		request.setAttribute("transmition", transmition);
		request.setAttribute("fuel", fuel);
		request.setAttribute("year", year);

		getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);

			
	}
	
	
}
