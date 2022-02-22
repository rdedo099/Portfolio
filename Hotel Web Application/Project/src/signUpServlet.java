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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

@WebServlet("/signUpServlet")
public class signUpServlet extends HttpServlet{
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
		String id = request.getParameter("radioBut3");
		System.out.print(id);
		
		String query = "";
		String toUp = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String email2 = request.getParameter("email2");
		String addy = request.getParameter("addy");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String cn = request.getParameter("cn");
		String jd = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		query = "INSERT INTO Project_Hotel.customers VALUES("+"'"+toUp+"','"+name+"','"+email+"','"+email2+"','"+addy+"','"+city+"','"+country+"','"+cn+"','"+jd+"')";
		try {
			Connection connect = connect();
			System.out.println(connect);
			System.out.println("Connected");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery(query);
			System.out.println("Executed");
			PrintWriter writer = response.getWriter();
			String html = "<html> <button onclick = \"parent.location='CustLogin.jsp'\">Home</button> </html>";
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