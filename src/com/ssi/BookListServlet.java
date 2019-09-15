package com.ssi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssi.utility.DBConnect;

@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	public void init(){
		DBConnect connection = DBConnect.connect(getServletContext());
		try {
			con = connection.getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subject[]=request.getParameterValues("subjectlist");
		String sql="SELECT bcode,title from books";
		String query = " where subject in(";
		if(subject != null) {
		for(String s:subject) {
			query=query+"'"+s+"'"+",";
		}
		sql = sql + query.substring(0, query.lastIndexOf(","))+")";	
		}
		try{
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs=stmt.executeQuery();
		request.setAttribute("ResultSet", rs);
		request.setAttribute("desired_subjects", subject);
		if(subject != null) {
		String subjects = "";
 		for(String s:subject) {
			subjects = subjects+s+", ";
		}
		Cookie c = new Cookie("subjectchoice",subjects.substring(0, subjects.lastIndexOf(",")).replace(" ", "_").replace(",", "__"));
		c.setMaxAge(60*60*24*7);
		response.addCookie(c);
		}
		else {
			Cookie c = new Cookie("subjectchoice","All Books".replace(" ", "_"));
			c.setMaxAge(60*60*24*7);
			response.addCookie(c);
		}
		RequestDispatcher rd = request.getRequestDispatcher("BookList.jsp");
		rd.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}