import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet{
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
	private void setFalse(String x) {
		if(x.length()<1) {
			x="false";
		}
	}
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		System.out.print("Called");
		String id = request.getParameter("radioBut3");
		System.out.print(id);
		
		String query = "";
		if("Employee".contentEquals(id)) {
		String toUp = request.getParameter("eid");
		String mid = request.getParameter("mid");
		System.out.print(mid);
		String hid = request.getParameter("hid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String pn = request.getParameter("pn");
		String jd = request.getParameter("jd");
		if (mid.length()<1) {
			query="INSERT INTO Project_Hotel.employees (employee_id, hotel_id, employee_fname, employee_lname, phone_numer, joined_date) VALUES("+"'"+toUp+"',"+"'"+hid+"',"+"'"+fname+"',"+"'"+lname+"',"+"'"+pn+"',"+"'"+jd+"')";
		}else {
		query = "INSERT INTO Project_Hotel.employees VALUES("+"'"+toUp+"',"+"'"+hid+"',"+"'"+mid+"',"+"'"+fname+"',"+"'"+lname+"',"+"'"+pn+"',"+"'"+jd+"')";//insert vals
		} 
		}else if("Customer".contentEquals(id)) {
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
		}else if("Hotel".contentEquals(id)) {
		String toUp = request.getParameter("id");
		String chid = request.getParameter("chid");
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String addy = request.getParameter("addy");
		String ps = request.getParameter("ps");
		String zc = request.getParameter("zc");
		String nr = request.getParameter("nr");
		if (url.length()<1) {
		query = "INSERT INTO Project_Hotel.hotels (hotel_id,chain_hotel_id,hotel_name,hotel_address,city,province_state,zip_code,country,number_rooms) VALUES("+"'"+toUp+"',"+"'"+chid+"',"+"'"+name+"',"+"'"+addy+"',"+"'"+city+"',"+"'"+ps+"',"+"'"+zc+"',"+"'"+country+"',"+"'"+url+"',"+"'"+nr+"')";	
		}
		query = "INSERT INTO Project_Hotel.hotels VALUES("+"'"+toUp+"',"+"'"+chid+"',"+"'"+name+"',"+"'"+addy+"',"+"'"+city+"',"+"'"+ps+"',"+"'"+zc+"',"+"'"+country+"',"+"'"+nr+"')";
		}else if("Room".contentEquals(id)) {
		String toUp = request.getParameter("id");
		String sid = request.getParameter("sid");
		String hid = request.getParameter("hid");
		String rn = request.getParameter("rn");
		String mv = request.getParameter("mv");
		setFalse(mv);
		String sv = request.getParameter("sv");
		setFalse(sv);
		String tv = request.getParameter("tv");
		setFalse(tv);
		String ac = request.getParameter("ac");
		String fridge = request.getParameter("fridge");
		setFalse(fridge);
		String smoke = request.getParameter("smoke");
		setFalse(smoke);
		String available = request.getParameter("available");
		setFalse(available);
		String rf = request.getParameter("rf");
		String price = request.getParameter("price");
		String marks = request.getParameter("marks");
		if(marks.length()<1) {marks="n/a";}
		String ps = request.getParameter("ps");
		String oth = request.getParameter("oth");
		if(oth.length()<1) {oth="n/a";}
		query = "INSERT INTO Project_Hotel.hotel_rooms Values ("+"'"+toUp+"',"+"'"+hid+"',"+"'"+sid+"',"+"'"+rn+"',"+"'"+mv+"',"+"'"+sv+"',"+"'"+tv+"',"+"'"+ac+"',"+"'"+fridge+"',"+"'"+rf+"',"+"'"+smoke+"',"+"'"+available+"',"+"'"+price+"',"+"'"+marks+"',"+"'"+ps+"',"+"'"+oth+"')";
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