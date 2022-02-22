import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;

@WebServlet("/payServlet")
public class payServlet extends HttpServlet{
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
		String id = request.getParameter("rn");
		System.out.print(id);
		
		String query = "SELECT * FROM project_hotel.rentings WHERE renting_number ='"+id+"'";
		String cur = request.getParameter("cur");
		String date = request.getParameter("date");

		//
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			result.next();
			String room_id = result.getString("room_id");
			String total_price = result.getString("total_price");
			String query2 = "INSERT INTO Project_Hotel.payments VALUES("+"'"+id+"','"+room_id+"','"+total_price+"','"+cur+"','"+date+"')";
			Statement state2 = connect.createStatement();
			ResultSet result2 = state2.executeQuery(query2);
			System.out.println("Executed");
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='StaffHome.jsp'\">Home</button> </html>";
			writer.println(html);
			result.next();
			result2.next();
			result.close();
			result2.close();
			state.close();
			state2.close();
			connect.close();
		} catch (SQLException ex) {
			System.out.println("Database not connnected");
			System.out.println(ex.getMessage());
		}
	}
}