<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(request.getAttribute("AddedProduct") == null){ %>
<h2 align="center">Add Book</h2>
<hr>
<form action="AddBook" method="post">
<table  style="margin-left: 40%;">
<tr><td>Book Code</td><td><input type="text" name="bcode"></td></tr>
<tr><td>Title</td><td><input type="text" name="title"></td></tr>
<tr><td>Author</td><td><input type="text" name="author"></td></tr>
<tr><td>Subject</td><td><input type="text" name="subject"></td></tr>
<tr><td>Price</td><td><input type="text" name="price"></td></tr>
<tr><td></td><td><input style="width:50%" type="submit"><input style="width:50%" type="reset"></td></tr>
</table>
</form>
<hr>
<a style="margin-left:45%" href="adminpage.jsp">Back to Dashboard</a>
<%} 
else{%>
<h2 align="center">Book Added Successfully !</h2>
<hr>
<table border="1" style="margin-left: 43%">
<tr><td>Book Code</td><td>${AddedProduct.getBcode()}</td></tr>
<tr><td>Title</td><td>${AddedProduct.getTitle()}</td></tr>
<tr><td>Author</td><td>${AddedProduct.getAuthor()}</td></tr>
<tr><td>Subject</td><td>${AddedProduct.getSubject()}</td></tr>
<tr><td>Price</td><td>${AddedProduct.getPrice()}</td></tr>
</table>
<hr>
<a style="margin-left:40%" href="adminpage.jsp">Back to Dashboard</a>&nbsp;&nbsp;&nbsp;<a href="Book.jsp">Add More Book</a>
<%}%>

</body>
</html>