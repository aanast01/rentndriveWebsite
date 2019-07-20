

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

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");		
		String whatsup = request.getParameter("whatsup");		
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
			if (conn == null)
				System.out.println("Connection problem");
			
			Statement stmt = conn.createStatement();
			
			String query;
			
			query = "insert into clients values('" + firstname + "','" + lastname + "','" +
					phone + "','pic', '"+ email  +"',";
					
			if (whatsup != null)
				query = query + "'1', '";
			else
				query = query + "'0', '";
			
			query = query + password  +"');";

			stmt.executeUpdate(query);
			
			request.setAttribute("email", email);
			getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	
	}

}
