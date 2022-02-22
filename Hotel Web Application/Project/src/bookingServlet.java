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

@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
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
		System.out.print("Called");
		String query = "";
		String bid = request.getParameter("booking_number");
		String eid = request.getParameter("employee_id");
		query = "INSERT INTO Project_Hotel.rentings (renting_number,booking_number,employee_id,ssn,room_id,checkin,checkout, total_price) SELECT booking_number,booking_number,'"+eid+"',ssn,room_id,start_date,end_date, total_price FROM Project_Hotel.bookings WHERE booking_number ='"+bid+"'";
		String query2 = "DELETE FROM Project_Hotel.rentings WHERE booking_number ='"+bid+"'";
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			ResultSet result2 = state.executeQuery(query2);
			System.out.println("Executed");
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='StaffHome.jsp'\">Home</button> </html>";
			writer.println(html);
			result.next();
			result2.next();
			result.close();
			result2.close();
			state.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
}
