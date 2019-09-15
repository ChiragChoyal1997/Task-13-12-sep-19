package com.ssi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ssi.service.ProductService;
import com.ssi.utility.Product;
@WebServlet("/UpdateBook")
public class UpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String oldbcode = request.getParameter("oldbcode");
		String bcode = request.getParameter("bcode");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String subject = request.getParameter("subject");
		String price = request.getParameter("price");
		
		Product p = new Product(bcode, title, author, subject, price);
		
		ProductService ps = new ProductService();
		request.setAttribute("UpdatedProduct", ps.updateProduct(p,oldbcode));
		
		RequestDispatcher rd = request.getRequestDispatcher("UpdateBook.jsp");
		rd.forward(request, response);
	}
}
