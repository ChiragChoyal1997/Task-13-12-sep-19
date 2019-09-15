<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(request.getAttribute("UpdatedProduct") == null){ %>
<h2 align="center">Update the details of Book</h2>
<form action="UpdateBook" method="Post">
<hr>
<table style="margin-left:40%;margin-top: 2%;margin-bottom: 2%;">
<tr><td><input type="hidden" name="oldbcode" value="${GetProduct.getBcode()}"></td><td></td></tr>
<tr><td>Book Code</td><td><input type="text" name="bcode" value="${GetProduct.getBcode()}"></td></tr>
<tr><td>Title</td><td><input type="text" name="title" value='${GetProduct.getTitle()}'></td></tr>
<tr><td>Author</td><td><input type="text" name="author" value="${GetProduct.getAuthor()}"></td></tr>
<tr><td>Subject</td><td><input type="text" name="subject" value="${GetProduct.getSubject()}"></td></tr>
<tr><td>Price</td><td><input type="text" name="price" value="${GetProduct.getPrice()}"></td></tr>
<tr><td></td><td><input type="submit"></td></tr>
</table>
</form>
<hr>
<%}%>
<%if(request.getAttribute("UpdatedProduct")!=null){ %>
<h2 align="center">Updated Done</h2>
<hr>
<table border="1" style="margin-left:40%;margin-top: 2%;margin-bottom: 2%;">
<tr><td>Book Code</td><td>${UpdatedProduct.getBcode()}</td></tr>
<tr><td>Title</td><td>${UpdatedProduct.getTitle()}</td></tr>
<tr><td>Author</td><td>${UpdatedProduct.getAuthor()}</td></tr>
<tr><td>Subject</td><td>${UpdatedProduct.getSubject()}</td></tr>
<tr><td>Price</td><td>${UpdatedProduct.getPrice()}</td></tr>
</table>
<hr>
<%} %>
<a href="adminpage.jsp">Back-To-Dashboard</a>
</body>
</html>