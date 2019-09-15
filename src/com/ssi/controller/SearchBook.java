package com.ssi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ssi.service.ProductService;

/**
 * Servlet implementation class SearchBook
 */
@WebServlet("/SearchBook")
public class SearchBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codeortitle = request.getParameter("codeortitle");
		ProductService ps = new ProductService();
		request.setAttribute("SearchResult", ps.getSearchProducts(codeortitle));
//		HttpSession session = request.getSession(false);
//		session.removeAttribute("SearchResult");
//		if(codeortitle != null && codeortitle != "" ) {
//			session.setAttribute("SearchResult",ps.getSearchProducts(codeortitle));	
//		}
		//response.sendRedirect("adminpage.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("adminpage.jsp");
		rd.forward(request, response);
	}

}
