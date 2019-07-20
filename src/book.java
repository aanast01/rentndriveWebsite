

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class book
 */
@WebServlet("/book")
public class book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int carId = Integer.parseInt(request.getParameter("carId"));
		String startingDate = request.getParameter("startingDate");
		String finishingDate = request.getParameter("finishinDate");
		int clientPhone= Integer.parseInt(request.getParameter("clientPhone"));
		
		request.setAttribute("carId", carId);
		request.setAttribute("clientPhone", clientPhone);
		request.setAttribute("startingDate", startingDate);
		request.setAttribute("finishingDate", finishingDate);
		
		getServletContext().getRequestDispatcher("/confirmation.jsp").forward(request, response);

	
	}

}
