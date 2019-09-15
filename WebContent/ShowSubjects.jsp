<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.ssi.utility.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
Cookie ck[] = (Cookie [])request.getAttribute("Cookie");
String offer = "";
if(ck!=null) {
	for(Cookie c:ck){
		String name=c.getName();
		if(name.equals("subjectchoice")){
			offer=c.getValue().replace("__", ",").replace("_", " ");
		}
	}
}
%>
<marquee><h3>Attractive Offers On <%=offer %></h3></marquee>
<hr>
<h3 align="center">Select The Desired Subject</h3>
<form action="BookListServlet" method="post">
<pre>
<%
while(rs.next()){
	String sub=rs.getString(1);
	String querystring = sub.replace(' ', '+');
%>
										<input  type="checkbox" name="subjectlist" value="<%=sub%>"><%=sub %></input>
<% 
}
%>
										<input type="submit" value="Books for Selected Subjects">
</pre>
</form>
<hr>
<a href=buyerpage.jsp>Buyer-Page</a>
<%
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>