package com.ssi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssi.service.ProductService;

@WebServlet("/GetAllBooks")
public class GetAllBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductService();
		request.setAttribute("AllBooks", ps.getAllProducts());
		RequestDispatcher rd = request.getRequestDispatcher("GetAllBooks.jsp");
		rd.forward(request, response);
	}

}