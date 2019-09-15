package com.ssi.DAO;

import java.util.List;

import com.ssi.utility.Product;

public interface ProductDAO {
	
	public int addBook(Product p);
	public int deleteBook(String bcode);
	public List<Product> getAllBooks();
	public Product updateBook(Product p,String bcode);
	public Product getBook(String bcode);
	public List<Product> getSearchBooks(String bcodeortitle);
}
