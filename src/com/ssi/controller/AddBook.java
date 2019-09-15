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

@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bcode = request.getParameter("bcode");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String subject = request.getParameter("subject");
		String price = request.getParameter("price");
		
		Product item = new Product(bcode, title, author, subject, price);
		ProductService ps = new ProductService();
		request.setAttribute("AddedProduct", ps.addProduct(item));
		RequestDispatcher rd = request.getRequestDispatcher("Book.jsp");
		rd.forward(request, response);
	}

}
