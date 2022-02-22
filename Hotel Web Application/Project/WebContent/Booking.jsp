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
<form name = "book" method = "post" action = "bookServlet"> 
<%
%>
<%! String driverName = "org.postgresql.Driver"; %>
<%! String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/ssenn005"; %>
<%! String username = "ssenn005"; %>
<%! String password = "Massil1234!"; %>
<%
Connection connect = null;
PreparedStatement prepState = null;
%>

	<%
	try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String query = (request.getAttribute("room_id")).toString();
	String fq = (String)request.getAttribute("room_id"); 
	prepState = connect.prepareStatement(fq);
	ResultSet result = prepState.executeQuery();
	
	%>

	<p> Select Room:
	<select name ="room">
	<%
	while(result.next())
	{
		String name = result.getString("room_id");
		%>
		<option value ="<%=name %>"><%=name %></option>
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
<input type="text" placeholder="SSN" name="ssn" required>
<input type="text" placeholder="Current Date" name="bookind_date" required>
<input type="text" placeholder="Checkin Date" name="start_date" required>
<input type="text" placeholder="Checkout Date" name="end_date" required>
<input type="text" placeholder="How Long is Your Stay" name="length" required>
<button type="submit" onclick = "parent.location='CustHome.jsp'">Book!</button>
</form>
</body>
</html>