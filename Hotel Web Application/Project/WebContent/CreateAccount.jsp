<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <form name = "insert2" method = "post" action = "signUpServlet">
    <label for="id"><b>SSN</b></label>
    <input type="text" placeholder="Enter Customer SSN" name="id" required>
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Customer Name" name="name" required>
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Customer Email" name="email" required>
    <label for="email2"><b>Second Email</b></label>
    <input type="text" placeholder="Enter Other Customer Email" name="email2" required>
    <label for="addy"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="addy" required>
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter Customer's City" name="city" required>
    <label for="country"><b>Country</b></label>
    <input type="text" placeholder="Enter Customer's Country" name="country" required>
    <label for="cn"><b>Contact Number</b></label>
    <input type="text" placeholder="Enter Customer Contact Number" name="cn" required>
    <button type="submit">Create Account</button>
  </form>
</body>
</html>