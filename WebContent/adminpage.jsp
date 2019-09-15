<%@page import="com.ssi.utility.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.directory.SearchResult"%>
<html>
<head>
</head>
<body>
	<h2 align="center">DashBoard For Admin</h2>
	<div style="border:1px solid black;height: 100%;">
	<div style="padding:10px 10px 10px 30px;width:30%;float:left;height:inherit;">
		<br>
		<a href="Book.jsp">Add-Book</a><br><br>
		<a href="GetAllBooks">Get-All-Books</a><br><br>
		<a href="">View-Orders</a><br><br>
		<a href="LogOut">Logout</a><br><br>
	</div>
	<div style="float:left;width:66.7%;border-left: 1px solid black;height:inherit;">
	<h2 align="center">Search book by Title/Book Code</h2>
	<h4 align="center">(To delete or update a book record)</h4>
	<form action="SearchBook" method="post">
	<table style="margin-left: 25%;">
	<tr><td>Search By Title/Book Code </td><td><input type="text" name="codeortitle"></td></tr>
	<tr><td></td><td><input style="width:50%" type="submit"><input style="width:50%" type="reset"></td></tr>
	</table>
	</form>
	<%if(request.getAttribute("SearchResult") != null){ %>
	<hr>
	<table border="1" style="width:98%;margin-top: 3%;margin-left:1%;">
	<tr><th>Book Code</th><th>Title</th><th>Author</th><th>Subject</th><th>Price</th><th>Update</th><th>Delete</th></tr>
	<%
	for(Product p:(ArrayList<Product>)request.getAttribute("SearchResult")) {%>
	<tr><td align="center"><%=p.getBcode()%></td><td align="center"><%=p.getTitle()%></td><td align="center"><%=p.getAuthor()%></td><td align="center"><%=p.getSubject()%></td><td align="center"><%=p.getPrice()%></td><td align="center"><a href="GetBook?bcode=<%=p.getBcode()%>">Update</a></td><td align="center"><a href="DeleteBook?bcode=<%=p.getBcode()%>">Delete</a></td></tr>
	<%}	
	%>
	</table>
	<%} %>
	</div>
	</div>		
</body>
</html>