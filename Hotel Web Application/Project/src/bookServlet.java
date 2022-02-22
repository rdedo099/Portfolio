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

@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet{
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
		String ssn = request.getParameter("ssn");
		String rid = request.getParameter("room");
		String bookind_date = request.getParameter("bookind_date");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String length = request.getParameter("length");
		int id = Integer.parseInt(ssn) - 520031+Integer.parseInt(rid)/Integer.parseInt(length);
		System.out.print(id);
		String query = "Select nightly_price FROM Project_Hotel.hotel_rooms WHERE room_id= '"+rid+"'";
		
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			result.next();
			int tot_price = Integer.parseInt(result.getString("nightly_price").substring(1,3))*Integer.parseInt(length);
			System.out.print(tot_price);
			String room_type = "SELECT size_desc FROM project_hotel.room_size WHERE size_id = (SELECT size_id FROM project_hotels.hotel_rooms WHERE room_id='"+rid+"')";
			Statement state3 = connect.createStatement();
			ResultSet result3 = state3.executeQuery(room_type);
			String insert = "INSERT INTO Project_Hotel.bookings VALUES ('"+id+"','"+ssn+"','"+rid+"','"+bookind_date+"','"+start_date+"','"+end_date+"','"+tot_price+"')";
			System.out.print(insert);
			Statement state2 = connect.createStatement();
			ResultSet result2 = state2.executeQuery(insert);
			System.out.println("Executed");
			result.close();
			state.close();
			result2.close();
			state2.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
}