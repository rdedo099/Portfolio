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

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet{
	private static final long serialVersionUID = 33933358690340991L;
	public updateServlet() {
		
	}
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
	public void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("radioBut2");
		String col = request.getParameter("radioBut3");
		System.out.print(col);
		String curId = request.getParameter("selID");
		String insert = request.getParameter(col);
		System.out.print(id);
		String query = "UPDATE Project_Hotel."+id+" SET "+col+" = '"+insert+"' WHERE employee_id ="+ curId;
		System.out.println(query);
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			System.out.println("Executed");
			result.next();
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='StaffHome.jsp'\">Update Made, Go Back</button> </html>";
			writer.println(html);
			result.close();
			state.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
}