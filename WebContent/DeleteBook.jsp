<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">Deleted Book Record !</h3>
<hr>
<table border="1" style="margin-left:42%;">
<tr><td>Book Code</td><td>${DeletedProduct.getBcode()}</td></tr>
<tr><td>Title</td><td>${DeletedProduct.getTitle()}</td></tr>
<tr><td>Author</td><td>${DeletedProduct.getAuthor()}</td></tr>
<tr><td>Subject</td><td>${DeletedProduct.getSubject()}</td></tr>
<tr><td>Price</td><td>${DeletedProduct.getPrice()}</td></tr>
</table>
<hr>
<a href="adminpage.jsp">Back To DashBoard</a>
</body>
</html>