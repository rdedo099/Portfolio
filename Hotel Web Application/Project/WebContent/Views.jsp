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
	String ps = "SELECT DISTINCT province_state FROM project_hotel.hotels";
	prepState = connect.prepareStatement(ps);
	ResultSet result = prepState.executeQuery();
	%>

	<p> View 1:</p>
	<%
	while(result.next())
	{
		String number = "SELECT * FROM project_hotel.hotels WHERE province_state ='"+result.getString("province_state")+"'";
		prepState = connect.prepareStatement(number);
		ResultSet result2 = prepState.executeQuery();
		String name = result.getString("province_state");
		int total = 0;
		while (result2.next()){
		total += Integer.parseInt(result2.getString("number_rooms"));
		}
		%>
		<p> <%=name %> | <%=total %>
		<%
	}
	%>
	</p>
	<%
	connect.close();
} catch(SQLException e){
	out.println(e);
}
%>
<%
	try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String hi = "SELECT DISTINCT hotel_id FROM project_hotel.hotel_rooms";
	prepState = connect.prepareStatement(hi);
	ResultSet result3 = prepState.executeQuery();
	%>

	<p> View 2:</p>
	<%
	while(result3.next())
	{
		String number2 = "SELECT * FROM project_hotel.hotel_rooms WHERE hotel_id ='"+result3.getString("hotel_id")+"' AND availabiltty_status = 'true'";
		prepState = connect.prepareStatement(number2);
		ResultSet result4 = prepState.executeQuery();
		String name1 = result3.getString("hotel_id");
		int total1 = 0;
		while (result4.next()){
		total1 += Integer.parseInt(result4.getString("maximum_capacity"));
		}
		%>
		<p> <%=name1 %> | <%=total1 %>
		<%
	}
	%>
	</p>
	<%
	connect.close();
} catch(SQLException e){
	out.println(e);
}
%>
</body>
</html>