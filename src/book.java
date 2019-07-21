

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

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
		String finishingDate = request.getParameter("finishingDate");
		int clientPhone= Integer.parseInt(request.getParameter("clientPhone"));
		String email=request.getParameter("email");
		
		request.setAttribute("carId", carId);
		request.setAttribute("clientPhone", clientPhone);
		request.setAttribute("startingDate", startingDate);
		request.setAttribute("finishingDate", finishingDate);
		request.setAttribute("email", email);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.10.108:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "panikos", "rentndrive");
			if (conn == null)
				System.out.println("Connection problem");
			
			Statement stmt = conn.createStatement();			
			String query = "INSERT INTO cars_has_clients (CarID, ClientPhoneNumber, StartRentDate, EndRentDate) VALUES ("+carId+", "+ clientPhone+", '"+startingDate+"', '"+finishingDate+"');";
            Statement statement = conn.prepareStatement(query);

            statement.executeUpdate(query);
		
		getServletContext().getRequestDispatcher("/confirmation.jsp").forward(request, response);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

}
