<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script language = "Javascript">
function insertEmployee(x){
	if (x.checked){
		document.getElementById("customer").style.visibility = "hidden"
		document.getElementById("hotel").style.visibility = "hidden"
		document.getElementById("room").style.visibility = "hidden"
		document.getElementById("employee").style.visibility = "visible"
	}
}
function insertCustomer(x){
	if (x.checked){
		document.getElementById("customer").style.visibility = "visible"
		document.getElementById("hotel").style.visibility = "hidden"
		document.getElementById("room").style.visibility = "hidden"
		document.getElementById("employee").style.visibility = "hidden"
	}
}
function insertHotel(x){
	if (x.checked){
		document.getElementById("customer").style.visibility = "hidden"
		document.getElementById("hotel").style.visibility = "visible"
		document.getElementById("room").style.visibility = "hidden"
		document.getElementById("employee").style.visibility = "hidden"
	}
}
function insertRoom(x){
	if (x.checked){
		document.getElementById("customer").style.visibility = "hidden"
		document.getElementById("room").style.visibility = "visible"
		document.getElementById("hotel").style.visibility = "hidden"
		document.getElementById("employee").style.visibility = "hidden"
	}
}
</script>
<form name = "insert" method = "post" action = "insertServlet">
<input type = "checkbox" onclick = "insertEmployee(this)" name = "radioBut3" value = "Employee" >Employee
<div id ="employee" style="visibility:hidden">
    <label for="eid"><b>Employee ID</b></label>
    <input type="text" placeholder="Enter Employee ID" name="eid" required>
    <label for="mid"><b>Manager ID</b></label>
    <input type="text" placeholder="Enter Manager ID" name="mid">
    <label for="hid"><b>Hotel ID</b></label>
    <input type="text" placeholder="Enter Hotel ID" name="hid" required>
    <label for="fname"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="fname" required>
    <label for="lname"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="lname" required>
    <label for="pn"><b>Phone Number</b></label>
    <input type="text" placeholder="Enter Phone Number" name="pn" required>
    <label for="jd"><b>Join Date</b></label>
    <input type="text" placeholder="Enter Join Date" name="jd" required>
    <button type="submit">Create Insert</button>
  </div>
  </form>
  <form name = "insert2" method = "post" action = "insertServlet">
 	<input type = "checkbox" onchange = "insertCustomer(this)" name ="radioBut3" value="Customer">Customer  
  <div id ="customer" style="visibility:hidden">
    <label for="id"><b>SSN</b></label>
    <input type="text" placeholder="Enter Customer SSN" name="id" required>
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Customer Name" name="name" required>
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Customer Email" name="email" required>
    <label for="email2"><b>Second Email</b></label>
    <input type="text" placeholder="Enter Other Customer Email" name="email2" required>
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter Customer's City" name="city" required>
    <label for="country"><b>Country</b></label>
    <input type="text" placeholder="Enter Customer's Country" name="country" required>
    <label for="cn"><b>Contact Number</b></label>
    <label for="addy"><b>Address</b></label>
    <input type="text" placeholder="Enter Customer's Address" name="addy" required>
    <input type="text" placeholder="Enter Customer Contact Number" name="cn" required>
    <label for="jd"><b>Join Date</b></label>
    <input type="text" placeholder="Enter Customer Join Date" name="jd" required>
    <button type="submit">Create Insert</button>
  </div>
  </form>
  <form name = "insert3" method = "post" action = "insertServlet">
  <input type = "checkbox" onchange = "insertHotel(this)" name ="radioBut3" value ="Hotel">Hotel
    <div id ="hotel" style="visibility:hidden">
    <label for="id"><b>Hotel ID</b></label>
    <input type="text" placeholder="Enter Hotel ID" name="id" required>
    <label for="chid"><b>Hotel Chain ID</b></label>
    <input type="text" placeholder="Enter Hotel Chain ID" name="chid" required>
    <label for="name"><b>Hotel Name</b></label>
    <input type="text" placeholder="Enter Hotel Name" name="name" required>
    <label for="url"><b>Hotel URL</b></label>
    <input type="text" placeholder="Enter Hotel URL" name="url">
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter Hotel's City" name="city" required>
    <label for="country"><b>Country</b></label>
    <input type="text" placeholder="Enter Hotel's Country" name="country" required>
    <label for="addy"><b>Hotel's Address</b></label>
    <input type="text" placeholder="Enter Hotel's Address" name="addy" required>
    <label for="ps"><b>Province/State</b></label>
    <input type="text" placeholder="Enter Hotel's Province/State" name="ps" required>
    <label for="zc"><b>Hotel's Zip Code</b></label>
    <input type="text" placeholder="Enter Hotel's Zip Code" name="zc" required>
    <label for="nr"><b>Number of Rooms</b></label>
    <input type="text" placeholder="Enter Hotel's Number of Rooms" name="nr" required>
    <button type="submit">Create Insert</button>
  </div>
  </form>
  <form name = "insert4" method = "post" action = "insertServlet">
  <input type = "checkbox" onchange = "insertRoom(this)" name = "radioBut3" value="Room">Room
    <div id ="room" style="visibility:hidden">
    <label for="id"><b>Room ID</b></label>
    <input type="text" placeholder="Enter Room ID" name="id" required>
    <label for="sid"><b>Size ID</b></label>
    <input type="text" placeholder="Enter Size ID" name="sid" required>
    <label for="rn"><b>Room Number</b></label>
    <input type="text" placeholder="Enter Room Number" name="rn" required>
    <label for="mv"><b>Mountain View</b></label>
    <input type="checkbox" name="mv" value="true">
    <label for="sv"><b>Sea View</b></label>
    <input type="checkbox" name="sv" value="true">
    <label for="tv"><b>TV</b></label>
    <input type="checkbox" name="tv" value="true">
    <label for="ac"><b>AC</b></label>
    <input type="checkbox" name="ac" value="true">
    <label for="fridge"><b>Refrigerator</b></label>
    <input type="checkbox" name="fridge" value="true">
    <label for="smoke"><b>Smoking</b></label>
    <input type="checkbox" name="smoke" value="true">
    <label for="available"><b>Available</b></label>
    <input type="checkbox" name="available" value="true">
    <label for="rf"><b>Room Floor</b></label>
    <input type="text" placeholder="Enter Room's Floor" name="rf" required>
    <label for="price"><b>Price per Night</b></label>
    <input type="text" placeholder="Enter Nightly Price" name="price" required>
    <label for="marks"><b>Remarks</b></label>
    <input type="text" placeholder="Enter Remarks" name="marks">
    <label for="mc"><b>Maximum Capacity</b></label>
    <input type="text" placeholder="Enter Room's Maximum Capacity" name="ps" required>
    <label for="oth"><b>Other</b></label>
    <input type="text" placeholder="Enter Other Information" name="oth">
    <button type="submit">Create Insert</button>
  	</div>

    
</form>
    <button onclick = "parent.location='StaffHome.jsp'">Back</button>
</body>
</html>