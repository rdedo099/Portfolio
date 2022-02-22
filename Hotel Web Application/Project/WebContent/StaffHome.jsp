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
<script language = "Javascript">
function Opt1(x){
	if (x.checked){
		document.getElementById("2").style.visibility = "hidden"
		document.getElementById("3").style.visibility = "hidden"
		document.getElementById("4").style.visibility = "hidden"
		document.getElementById("1").style.visibility = "visible"
	}
}
function Opt2(x){
	if (x.checked){
		document.getElementById("1").style.visibility = "hidden"
		document.getElementById("3").style.visibility = "hidden"
		document.getElementById("4").style.visibility = "hidden"
		document.getElementById("2").style.visibility = "visible"
	}
}
function Opt3(x){
	if (x.checked){
		document.getElementById("1").style.visibility = "hidden"
		document.getElementById("2").style.visibility = "hidden"
		document.getElementById("4").style.visibility = "hidden"
		document.getElementById("3").style.visibility = "visible"
	}
}
function Opt4(x){
	if (x.checked){
		document.getElementById("1").style.visibility = "hidden"
		document.getElementById("2").style.visibility = "hidden"
		document.getElementById("3").style.visibility = "hidden"
		document.getElementById("4").style.visibility = "visible"
	}
}
function deleteCustomer(x){
	if (x.checked){
		document.getElementById("deleteCustomer").style.visibility = "visible"
		document.getElementById("deleteEmployee").style.visibility = "hidden"
		document.getElementById("deleteHotel").style.visibility = "hidden"
		document.getElementById("deleteRoom").style.visibility = "hidden"
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function deleteEmployee(x){
	if (x.checked){
		document.getElementById("deleteEmployee").style.visibility = "visible"
		document.getElementById("deleteHotel").style.visibility = "hidden"
		document.getElementById("deleteRoom").style.visibility = "hidden"
		document.getElementById("deleteCustomer").style.visibility = "hidden"
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function deleteRoom(x){
	if (x.checked){
		document.getElementById("deleteCustomer").style.visibility = "hidden"
		document.getElementById("deleteEmployee").style.visibility = "hidden"
		document.getElementById("deleteHotel").style.visibility = "hidden"
		document.getElementById("deleteRoom").style.visibility = "visible"
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function deleteHotel(x){
	if (x.checked){
		document.getElementById("deleteEmployee").style.visibility = "hidden"
		document.getElementById("deleteHotel").style.visibility = "visible"
		document.getElementById("deleteRoom").style.visibility = "hidden"
		document.getElementById("deleteCustomer").style.visibility = "hidden"
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}

</script>
<body>
<%! String driverName = "org.postgresql.Driver"; %>
<%! String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/ssenn005"; %>
<%! String username = "ssenn005"; %>
<%! String password = "Massil1234!"; %>
<%
Connection connect = null;
PreparedStatement prepState = null;
%>
<input type = "radio" onchange = "Opt1(this)" name ="radioBut" >Create Booking 
<input type = "radio" onchange = "Opt2(this)" name = "radioBut" >Make Update 
<input type = "radio" onchange = "Opt3(this)" name ="radioBut" >New Insert 
<input type = "radio" onchange = "Opt4(this)" name = "radioBut" >Delete Data
<button onclick = "parent.location='payment.html'">Insert Payment</button>
<div id="1" style="visibility:hidden">
<button onclick = "parent.location='NewBooking.jsp'">Existing Booking</button>
<button onclick = "parent.location='NewRenting.jsp'">Make New Renting</button>
</div>

<div id="2" style="visibility:hidden">
<button onclick = "parent.location='newUpdate.jsp'">Make New Updates</button>
</div>


<div id="3" style="visibility:hidden">
<button onclick = "parent.location='NewInsert.jsp'">Make New Insert</button>
</div>
<form name = "delete" method = "post" action = "deleteServlet">
<div id="4" style="visibility:hidden">
Delete a: 
<input type = "radio" onchange = "deleteCustomer(this)" name ="radioBut3" value="Customer" >Customer 
<input type = "radio" onchange = "deleteEmployee(this)" name = "radioBut3" value="Employee">Employee
<input type = "radio" onchange = "deleteHotel(this)" name ="radioBut3" value="Hotel">Hotel 
<input type = "radio" onchange = "deleteRoom(this)" name = "radioBut3" value="Room">Room
</div>
<div id="deleteCustomer" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.customers";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Customer to delete:
	<select name = "del">
	<%
	while(result.next())
	{
		String id = result.getString("ssn");
		%>
		<option value ="<%=id %>"><%=id %></option>
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
<button type="submit">Make Changes</button>
</div>
<div id="deleteEmployee" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.employees";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Employee to delete:
	<select name = "del">
	<%
	while(result.next())
	{
		String id = result.getString("employee_id");
		%>
		<option value ="<%=id %>"><%=id %></option>
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
<button type="submit">Make Changes</button>
</div>
<div id="deleteRoom" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.hotel_rooms";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Room to delete:
	<select name = "del">
	<%
	while(result.next())
	{
		String id = result.getString("room_id");
		%>
		<option value ="<%=id %>"><%=id %></option>
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
<button type="submit">Make Changes</button>
</div>
<div id="deleteHotel" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.hotels";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Hotel to delete:
	<select name = "del">
	<%
	while(result.next())
	{
		String id = result.getString("hotel_id");
		%>
		<option value ="<%=id %>"><%=id %></option>
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
<button type="submit">Make Changes</button>
</div>

</form>
</body>
</html>