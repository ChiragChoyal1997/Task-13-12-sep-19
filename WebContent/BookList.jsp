<%@page import="java.sql.ResultSet"%>
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
String desire="";
if(request.getAttribute("desired_subjects") != null){
String desiredsubject[] = (String [])request.getAttribute("desired_subjects");
for(String s:desiredsubject){
	desire = desire+" "+s+",";
}
desire = desire.substring(0, desire.lastIndexOf(","));
}
else{
	desire = "All Subject Area";
}
ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
%>
<h3 align="center">Books from<%=desire %></h3>
<hr>
<pre>
<%
while(rs.next()){
String code=rs.getString(1);
String title=rs.getString(2);
%>	
											<a href="BookDetailsServlet?code=<%=code%>"><%=title %></a><br>
<%
}
%>
</pre>
<hr>
<a href="SubjectPageServlet">Back to Subjects</a>
</body>
</html>