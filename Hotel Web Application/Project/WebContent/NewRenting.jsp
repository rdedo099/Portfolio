<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String driverName = "org.postgresql.Driver"; %>
<%! String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/ssenn005"; %>
<%! String username = "ssenn005"; %>
<%! String password = "Massil1234!"; %>
<%
Connection connect = null;
PreparedStatement prepState = null;
%>
<form name = "insert" method = "post" action = "rentingServlet">
<label for="renting_number"><b>Renting number</b></label>
<input type="text" placeholder="Enter Renting number" name="renting_number" required>
<label for="employee_id"><b>Employee ID</b></label>
<input type="text" placeholder="Enter Employee ID" name="employee_id" required>
<label for="checkin"><b>Check In Date</b></label>
<input type="text" placeholder="Enter Check In Date" name="checkin" required>
<label for="checkout"><b>Check Out Date</b></label>
<input type="text" placeholder="Enter Check Out Date" name="checkout" required>
<label for="total_price"><b>Total Price</b></label>
<input type="text" placeholder="Enter Total Price" name="total_price" required>
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.hotel_rooms WHERE availabiltty_status = 'true'";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Room:
	<select name="room_id">
	<%
	while(result.next())
	{
		String id = result.getString("room_id");
		String price = result.getString("nightly_price");
		%>
		<option value ="<%=id %>"><%=id %> Nightly Price: <%=price %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	connect.close();
} catch(SQLException e){
	out.println(e);
}
%>

<button type="submit">Create Renting</button>
</form>
</body>
</html>