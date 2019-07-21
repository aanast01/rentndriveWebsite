import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.codec.binary.Base64;



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
		String photo = request.getParameter("photo");

		FileInputStream inputStream = null;
		File image= new File(photo);
		inputStream = new FileInputStream(image);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.10.108:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "panikos", "rentndrive");
			if (conn == null)
				System.out.println("Connection problem");
			
			Statement stmt = conn.createStatement();
			
			String encodedfile = null;
		            try {
		                FileInputStream fileInputStreamReader = new FileInputStream(image);
		                byte[] bytes = new byte[(int)image.length()];
		                fileInputStreamReader.read(bytes);
			            encodedfile = new String(Base64.encodeBase64(bytes), "UTF-8");
		                encodedfile = Base64.encodeBase64(bytes).toString();
		            } catch (FileNotFoundException e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            } catch (IOException e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            }		
			
			
			String sql = "INSERT INTO clients values ('" + firstname +"','" + lastname + "','" + phone + "','" + encodedfile + "','" + email + "','";
			if (whatsup != null)
				sql = sql + "1', '";
			else
				sql = sql + "0', '";
			
			sql = sql + password  +"');";
            Statement statement = conn.prepareStatement(sql);
//            statement.setString(1, firstname);
//            statement.setString(2, lastname);
//            statement.setInt(3, phone);
//            statement.setString(5, email);
//			if (whatsup != null)
//	            statement.setInt(6, 1);
//			else
//	            statement.setInt(6, 0);
//
//            statement.setString(7, password);
//            statement.setBinaryStream(1, inputStream, image.length());

            statement.executeUpdate(sql);
			
//			String query;
//			
//			query = "insert into clients values('" + firstname + "','" + lastname + "','" +
//					phone + "','"+ photo +"', '"+ email  +"',";
//					
//			if (whatsup != null)
//				query = query + "'1', '";
//			else
//				query = query + "'0', '";
//			
//			query = query + password  +"');";
//
//			stmt.executeUpdate(query);
			
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
