import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/findRoomServlet")
public class findRoomServlet extends HttpServlet{
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
		String checkout = request.getParameter("checkout");
		String checkin = request.getParameter("checkin");
		String province_state = request.getParameter("province_state");
		String maximum_capacity = request.getParameter("maximum_capacity");
		String hotel_chain_id = request.getParameter("hotel_chain_id");
		String star_rating = request.getParameter("star_rating");
		String number_rooms = request.getParameter("number_rooms");
		String nightly_price = request.getParameter("nightly_price");
		
		String query = "Select room_id FROM Project_Hotel.hotel_rooms WHERE room_id=room_id ";
		if(!"any".contentEquals(checkout)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.rentings WHERE checkout ='"+checkout+"')";
		}
		if(!"any".contentEquals(checkin)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.rentings WHERE checkout ='"+checkin+"')";
		}
		if(!"any".contentEquals(province_state)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.hotel_rooms WHERE hotel_id IN (SELECT hotel_id FROM project_hotel.hotels WHERE province_state ='"+province_state+"'))";
		}
		if(!"any".contentEquals(maximum_capacity)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.hotel_rooms WHERE maximum_capacity ='"+maximum_capacity+"')";
		}
		if(!"any".contentEquals(hotel_chain_id)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.hotel_rooms WHERE hotel_id IN (SELECT hotel_id FROM project_hotel.hotels WHERE chain_hotel_id='"+hotel_chain_id+"'))";
		}
		if(!"any".contentEquals(star_rating)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.hotel_rooms WHERE hotel_id IN (SELECT hotel_id FROM project_hotel.hotel_ratings WHERE hotel_id='"+star_rating+"'))";
		}
		if(!"any".contentEquals(number_rooms)) {
			query += "AND room_id IN (SELECT room_id FROM project_hotel.hotel_rooms WHERE hotel_id IN (SELECT hotel_id Project_Hotel.hotels WHERE number_rooms ='"+number_rooms+"')";
		}
		if(!"any".contentEquals(nightly_price)) {
			query += "AND room_id IN (SELECT room_id FROM Project_Hotel.hotel_rooms WHERE nightly_price ='"+nightly_price+"')";
		}
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			System.out.print(query);
			System.out.println("Executed");
			request.setAttribute("room_id", query);
			request.getRequestDispatcher("Booking.jsp").forward(request, response);
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='Booking.jsp'\">Proceed With Booking</button> </html>";
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