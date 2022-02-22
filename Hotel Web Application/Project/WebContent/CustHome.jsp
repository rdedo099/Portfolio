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
<form name = "find rooms" method = "post" action = "findRoomServlet">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String startdate = "Select DISTINCT checkout FROM project_hotel.rentings";
	String enddate = "Select DISTINCT checkin FROM project_hotel.rentings";
	String area = "Select DISTINCT province_state FROM project_hotel.hotels";
	
	prepState = connect.prepareStatement(startdate);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Start Date:
	<select name ="checkout">
	
	<%
	while(result.next())
	{
		String id = result.getString("checkout");
		%>
		<option value ="<%=id %>"><%=id %></option>
		<%
	}
	%>
	<option value = "any" selected ="selected">Any</option>
	</select>
	</p>
	<%
	prepState = connect.prepareStatement(enddate);
	ResultSet result3 = prepState.executeQuery();
	%>
	<p> Select Start Date:
	<select name ="checkin">
	<option value = "any">Any</option>
	<%
	while(result3.next())
	{
		String id = result3.getString("checkin");
		%>
		<option value ="<%=id %>"><%=id %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	prepState = connect.prepareStatement(area);
	ResultSet result2 = prepState.executeQuery();
	%>
	<p> Select Province/State:
	<select name ="province_state">
	<option value = "any">Any</option>
	<%
	while(result2.next())
	{
		String id = result2.getString("province_state");
		%>
		<option value ="<%=id %>"><%=id %></option>
		<%
	}
	%>
	</select>
	</p>

<%
	String roomcap = "Select DISTINCT maximum_capacity FROM project_hotel.hotel_rooms";
	prepState = connect.prepareStatement(roomcap);
	ResultSet result4 = prepState.executeQuery();
	%>
	<p> Select Maximum Capacity:
	<select name ="maximum_capacity">
	<option value = "any">Any</option>
	<%
	while(result4.next())
	{
		String id = result4.getString("maximum_capacity");
		%>
		<option value ="<%=id %>"><%=id %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	String hotelchain = "Select DISTINCT * FROM project_hotel.hotel_chains";
	prepState = connect.prepareStatement(hotelchain);
	ResultSet result6 = prepState.executeQuery();
	%>
	<p> Select Hotel Chain:
	<select name ="hotel_chain_id">
	<option value = "any">Any</option>
	<%
	while(result6.next())
	{
		String id = result6.getString("hotel_chain_id");
		String name = result6.getString("hotel_chain_name");
		%>
		<option value ="<%=id %>"><%=name %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	String hotelrate = "Select DISTINCT star_rating FROM project_hotel.hotel_ratings";
	prepState = connect.prepareStatement(hotelrate);
	ResultSet result7 = prepState.executeQuery();
	%>
	<p> Select Hotel Rating:
	<select name ="star_rating">
	<option value = "any">Any</option>
	<%
	while(result7.next())
	{
		String name = result7.getString("star_rating");
		%>
		<option value ="<%=name %>"><%=name %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	String numrooms = "Select DISTINCT number_rooms FROM project_hotel.hotels";
	prepState = connect.prepareStatement(numrooms);
	ResultSet result8 = prepState.executeQuery();
	%>
	<p> Select Number of Rooms:
	<select name ="number_rooms">
	<option value = "any">Any</option>
	<%
	while(result8.next())
	{
		String name = result8.getString("number_rooms");
		%>
		<option value ="<%=name %>"><%=name %></option>
		<%
	}
	%>
	</select>
	</p>
	<%
	String pricerooms = "Select DISTINCT nightly_price FROM project_hotel.hotel_rooms";
	prepState = connect.prepareStatement(pricerooms);
	ResultSet result9 = prepState.executeQuery();
	%>
	
	<p> Select Nightly Price:
	<select name ="nightly_price">
	<option value = "any">Any</option>
	<%
	while(result9.next())
	{
		String name = result9.getString("nightly_price");
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

<button type="submit">Search</button>
</form>
<div style="visibility:hidden">
<input type="text" name="room_id"></div>
</body>
</html>