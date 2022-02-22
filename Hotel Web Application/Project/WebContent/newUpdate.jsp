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
function updateHotel(x){
	if (x.checked){
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "visible"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function updateRoom(x){
	if (x.checked){
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "visible"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function updateCustomer(x){
	if (x.checked){
		document.getElementById("updateEmployee").style.visibility = "hidden"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "visible"
	}
}
function updateEmployee(x){
	if (x.checked){
		document.getElementById("updateEmployee").style.visibility = "visible"
		document.getElementById("updateHotel").style.visibility = "hidden"
		document.getElementById("updateRoom").style.visibility = "hidden"
		document.getElementById("updateCustomer").style.visibility = "hidden"
	}
}
function emp(x){
	switch (x.value){
	case "employee_id":
		document.getElementById("eid").style.visibility = "visible"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "hotel_id":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "visible"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "manager_id":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "visible"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "employee_fname":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "visible"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "employee_lname":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "visible"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "phone_numer":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "visible"
		document.getElementById("jd").style.visibility = "hidden"
		break;
	case "joined_date":
		document.getElementById("eid").style.visibility = "hidden"
		document.getElementById("hid").style.visibility = "hidden"
		document.getElementById("mid").style.visibility = "hidden"
		document.getElementById("fname").style.visibility = "hidden"
		document.getElementById("lname").style.visibility = "hidden"
		document.getElementById("pn").style.visibility = "hidden"
		document.getElementById("jd").style.visibility = "visible"
		break;
	}
}
function cust(x){
	switch (x.value){
	case "ssn":
		document.getElementById("ssn").style.visibility = "visible"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_name":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "visible"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "email1":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "visible"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "email2":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "visible"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_address":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "visible"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_city":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "visible"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_country":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "visible"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_contact_no":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "visible"
		document.getElementById("customer_registration_date").style.visibility = "hidden"
		break;
	case "customer_registration_date":
		document.getElementById("ssn").style.visibility = "hidden"
		document.getElementById("customer_name").style.visibility = "hidden"
		document.getElementById("email1").style.visibility = "hidden"
		document.getElementById("email2").style.visibility = "hidden"
		document.getElementById("customer_address").style.visibility = "hidden"
		document.getElementById("customer_city").style.visibility = "hidden"
		document.getElementById("customer_country").style.visibility = "hidden"
		document.getElementById("customer_contact_no").style.visibility = "hidden"
		document.getElementById("customer_registration_date").style.visibility = "visible"
		break;
	}
}
</script>
<%! String driverName = "org.postgresql.Driver"; %>
<%! String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/ssenn005"; %>
<%! String username = "ssenn005"; %>
<%! String password = "Massil1234!"; %>
<%
Connection connect = null;
PreparedStatement prepState = null;
%>
<form name = "update" method = "post" action = "updateServlet">
<div id="2" style="visibility:visible">
Make Update to: 
<input type = "radio" onchange = "updateCustomer(this)" name ="radioBut2" value="customers">Customer 
<input type = "radio" onchange = "updateEmployee(this)" name = "radioBut2" value ="employees" >Employee
<input type = "radio" onchange = "updateHotel(this)" name ="radioBut2" value="hotels" >Hotel 
<input type = "radio" onchange = "updateRoom(this)" name = "radioBut2" value = "hotel_rooms" >Room
</div>
<div id="updateCustomer" style="visibility:hidden">
Make Updates to:
<input type = "radio" onchange = "cust(this)" name ="radioBut3" value="ssn">SSN 
<input type = "radio" onchange = "cust(this)" name = "radioBut3" value ="customer_name" >Name
<input type = "radio" onchange = "cust(this)" name ="radioBut3" value="email1" >Email 
<input type = "radio" onchange = "cust(this)" name = "radioBut3" value = "email2" >Secondary Email
<input type = "radio" onchange = "cust(this)" name ="radioBut3" value="customer_address">Address 
<input type = "radio" onchange = "cust(this)" name = "radioBut3" value ="customer_city" >City
<input type = "radio" onchange = "cust(this)" name = "radioBut3" value ="customer_country" >Country
<input type = "radio" onchange = "cust(this)" name = "radioBut3" value ="customer_contact_no" >Phone Number
<input type = "radio" onchange = "cust(this)" name ="radioBut3" value="customer_registration_date" >Registration Date
<div id="ssn" style="visibility:hidden">
<label for="ssn"><b>SSN</b></label>
<input type="text" placeholder="Enter SSN" name="ssn">
</div>
<div id="customer_name" style="visibility:hidden">
<label for="customer_name"><b>Name</b></label>
<input type="text" placeholder="Enter Name" name="customer_name">
</div>
<div id="email1" style="visibility:hidden">
<label for="email1"><b>Email</b></label>
<input type="text" placeholder="Enter Email" name="email1">
</div>
<div id="email2" style="visibility:hidden">
<label for="email2"><b>Second Email</b></label>
<input type="text" placeholder="Enter Second Email" name="email2">
</div>
<div id="customer_address" style="visibility:hidden">
<label for="customer_address"><b>Address</b></label>
<input type="text" placeholder="Enter Address" name="customer_address">
</div>
<div id="customer_city" style="visibility:hidden">
<label for="customer_city"><b>City</b></label>
<input type="text" placeholder="Enter City" name="customer_city">
</div>
<div id="customer_country" style="visibility:hidden">
<label for="customer_country"><b>Country</b></label>
<input type="text" placeholder="Enter Country" name="customer_country">
</div>
<div id="customer_contact_no" style="visibility:hidden">
<label for="customer_contact_no"><b>Contact Number</b></label>
<input type="text" placeholder="Enter Contact Number" name="customer_contact_no">
</div>
<div id="customer_registration_date" style="visibility:hidden">
<label for="customer_registration_date"><b>Registration Date</b></label>
<input type="text" placeholder="Enter Registration Date" name="customer_registration_date">
</div>
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.customers";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Customer to update:
	<select>
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
</div>
<div id="updateEmployee" style="visibility:hidden">
Make Updates to:
<input type = "radio" onchange = "emp(this)" name ="radioBut3" value="employee_id">Employee ID 
<input type = "radio" onchange = "emp(this)" name = "radioBut3" value ="hotel_id" >Hotel ID
<input type = "radio" onchange = "emp(this)" name ="radioBut3" value="manager_id" >Manager ID 
<input type = "radio" onchange = "emp(this)" name = "radioBut3" value = "employee_fname" >First Name
<input type = "radio" onchange = "emp(this)" name ="radioBut3" value="employee_lname">Last Name 
<input type = "radio" onchange = "emp(this)" name = "radioBut3" value ="phone_numer" >Phone Number
<input type = "radio" onchange = "emp(this)" name ="radioBut3" value="joined_date" >Join Date
<div id="eid" style="visibility:hidden">
<label for="employee_id"><b>Employee ID</b></label>
<input type="text" placeholder="Enter Employee ID" name="employee_id">
</div>
<div id="hid" style="visibility:hidden">
<label for="hotel_id"><b>Hotel ID</b></label>
<input type="text" placeholder="Enter Hotel ID" name="hotel_id">
</div>
<div id="mid" style="visibility:hidden">
<label for="manager_id"><b>Manager ID</b></label>
<input type="text" placeholder="Enter Manager ID" name="manager_id">
</div>
<div id="fname" style="visibility:hidden">
<label for="employee_fname"><b>First Name</b></label>
<input type="text" placeholder="Enter First Name" name="employee_fname">
</div>
<div id="lname" style="visibility:hidden">
<label for="employee_lname"><b>Last Name</b></label>
<input type="text" placeholder="Enter Last Name" name="employee_lname">
</div>
<div id="pn" style="visibility:hidden">
<label for="phone_numer"><b>Phone Number</b></label>
<input type="text" placeholder="Enter Phone Number" name="phone_numer">
</div>
<div id="jd" style="visibility:hidden">
<label for="joined_date"><b>Join Date</b></label>
<input type="text" placeholder="Enter Join Date" name="joined_date">
</div>
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.employees";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Customer to update:
	<select name="selID">
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
</div>
<div id="updateRoom" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.hotel_rooms";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Room to update:
	<select>
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
</div>
<div id="updateHotel" style="visibility:hidden">
<%
try {
	Class.forName(driverName);
	connect = DriverManager.getConnection(url,username,password);
	String sql = "Select * FROM project_hotel.hotels";
	prepState = connect.prepareStatement(sql);
	ResultSet result = prepState.executeQuery();
	%>
	<p> Select Hotel to update:
	<select>
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

</div>
<button type="submit">Make Changes</button>
</form>

<button onclick = "parent.location='StaffHome.jsp'">Back</button>
</body>
</html>