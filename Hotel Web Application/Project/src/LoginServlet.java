import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 6801890945200540231L;
	public Connection connect() throws SQLException{
		String URL = "jdbc:postgresql://web0.site.uottawa.ca:15432/ssenn005"; 
		String userName = "ssenn005";
		String password = "Massil1234!";
		try { 
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException cnfe) {
			System.err.println("Could not find driver class");
		}
		return DriverManager.getConnection(URL, userName, password);
	}
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("uname");
		String query = "SELECT COUNT(*) FROM Project_Hotel.employees WHERE employee_id ="+ id;
		System.out.println(id);
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			System.out.println("Executed");
			result.next();
			int resId = result.getInt(1);//can be no id's of value 0 as this is the null value
			System.out.println(resId);
			PrintWriter writer = response.getWriter();
			if (resId != 0) {
			String html = "<html> <button onclick = \"parent.location='StaffHome.jsp'\">Go</button> </html>";
			writer.println(html);
			} else {
			String html = "<html> <button onclick = \"parent.location='StaffSignIn.html'\">Incorrect ID, try again</button></html>";
			writer.println(html);	
			}
			result.close();
			state.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
	
}
