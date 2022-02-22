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

@WebServlet("/deleteServlet")
public class deleteServlet extends StaffControlsServlet{
	private static final long serialVersionUID = 1789327276147677229L;
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("radioBut3");
		System.out.print(id);
		String toDel = request.getParameter("del");
		String query = "";
		if("Employee".contentEquals(id)) {
		query = "DELETE FROM Project_Hotel.employees WHERE employee_id ='"+ toDel+"'";
		} else if("Customer".contentEquals(id)) {
		query = "DELETE FROM Project_Hotel.customers WHERE ssn ='"+ toDel+"'";
		}else if("Hotel".contentEquals(id)) {
		query = "DELETE FROM Project_Hotel.hotels WHERE hotel_id ='"+ toDel+"'";
		}else if("Room".contentEquals(id)) {
		query = "DELETE FROM Project_Hotel.hotel_rooms WHERE room_id ='"+ toDel+"'";
		}
		System.out.println(id);
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			System.out.println("Executed");
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='StaffHome.jsp'\">Home</button> </html>";
			writer.println(html);
			result.next();
			result.close();
			state.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
}