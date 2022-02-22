<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name = "insert" method = "post" action = "bookingServlet">
<label for="booking_number"><b>Booking number</b></label>
<input type="text" placeholder="Enter Booking number" name="booking_number" required>
<label for="employee_id"><b>Employee ID</b></label>
<input type="text" placeholder="Enter Employee ID" name="employee_id" required>
<button type="submit">Create Renting</button>
</form>
</body>
</html>