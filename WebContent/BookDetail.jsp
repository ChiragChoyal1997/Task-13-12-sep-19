<%@page import="com.ssi.utility.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int count = (int)request.getAttribute("count");
int price = (int)request.getAttribute("Price");
if(count>5 && count<10){
	price = price + (int)(price*0.1);
}
else if(count>=10){
	price = price + (int)(price*0.2);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3 align="Center">Book-Details</h3>
<hr>
<table border=1 style="margin-left:43%">
<tr><td>BCode</td><td><%=request.getAttribute("BCode")%></td></tr>
<tr><td>Title</td><td><%=request.getAttribute("Title") %></td></tr>
<tr><td>Author</td><td><%=request.getAttribute("Author") %></td></tr>
<tr><td>Subject</td><td><%=request.getAttribute("Subject") %></td></tr>
<tr><td>Price</td><td><%=price%></td></tr>
</table>
<hr>

<form action="CartManager?price=<%=price%>" method="get">
<pre>
											<input type="hidden" name="BCode" value='<%=(String)request.getAttribute("BCode")%>'>
											<input type="submit" value="Add To Cart">
</pre>
</form>
<pre>
										<a href=SubjectPageServlet>Subject-Page</a>     <a href=buyerpage.jsp>Buyer-Page</a><br>
</pre>
</body>
</html>