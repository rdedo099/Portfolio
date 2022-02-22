<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name = "custLogin" method = "post" action = "lsignInServlet">
  <div class="container">
    <label for="uname"><b>SSN</b></label>
    <input type="text" placeholder="Enter SSN" name="uname" required>
    <button type="submit">Login</button>
  </div>
    <button onclick = "parent.location='index.html'">Back</button>
</form>
</body>
</html>