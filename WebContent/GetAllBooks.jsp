<%@page import="java.util.ArrayList"%>
<%@page import="com.ssi.utility.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">All Books In Inventory</h2>
<hr>
<table border="1" style="width:98%;margin-left:1%;margin-top: 2%;margin-bottom: 2%;">
<tr><th>Book Code</th><th>Title</th><th>Author</th><th>Subject</th><th>Price</th><th>Update</th><th>Delete</th></tr>
<%for(Product p:(ArrayList<Product>)request.getAttribute("AllBooks")) {%>
<tr><td align="center"><%=p.getBcode()%></td><td align="center"><%=p.getTitle()%></td><td align="center"><%=p.getAuthor()%></td><td align="center"><%=p.getSubject()%></td><td align="center"><%=p.getPrice()%></td><td align="center"><a href="GetBook?bcode=<%=p.getBcode()%>">Update</a></td><td align="center"><a href="DeleteBook?bcode=<%=p.getBcode()%>">Delete</a></td></tr>
<%} %>
</table>
<hr>
<a href="adminpage.jsp">Back To DashBoard</a>
</body>
</html>