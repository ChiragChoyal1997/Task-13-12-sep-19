<%@page import="com.ssi.utility.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.directory.SearchResult"%>
<html>
<head>
</head>
<body>
	<h2 align="center">DashBoard For Buyer</h2>
	<div style="border:1px solid black;height: 100%;">
	<div style="padding:10px 10px 10px 30px;width:30%;float:left;height:inherit;">
		<br>
		<a href="SubjectPageServlet">Explore-Store</a><br><br>
		<a href="ShowCart.jsp">View-Cart</a><br><br>
	    <a href="UpdateProfile.jsp">Update-Profile</a><br><br>
	    <a href="">Trace-Order</a><br><br>
		<a href="LogOut">Logout</a><br><br>
	</div>
	<div style="float:left;width:66.7%;border-left: 1px solid black;height:inherit;">
	<h2 align="center">Search book by Title/Book Code</h2>
	<form action="SearchBooks" method="post">
	<table style="margin-left: 25%;">
	<tr><td>Search By Title/Book Code </td><td><input type="text" name="codeortitle"></td></tr>
	<tr><td></td><td><input style="width:50%" type="submit"><input style="width:50%" type="reset"></td></tr>
	</table>
	</form>
	<%if(request.getAttribute("SearchResults") != null){ %>
	<hr>
	<table border="1" style="width:98%;margin-top: 3%;margin-left:1%;">
	<tr><th>Book Code</th><th>Title</th></tr>
	<%
	for(Product p:(ArrayList<Product>)request.getAttribute("SearchResults")) {%>
	<tr><td align="center"><%=p.getBcode()%></td><td align="center"><a href="BookDetailsServlet?code=<%=p.getBcode()%>"><%=p.getTitle()%></a></td></tr>
	<%}	
	%>
	</table>
	<%} %>
	</div>
	</div>		
</body>
</html>