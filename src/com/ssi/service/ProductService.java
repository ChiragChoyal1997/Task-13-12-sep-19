package com.ssi.service;

import java.util.List;

import com.ssi.DAO.ProductDAOImplementation;
import com.ssi.utility.Product;

public class ProductService {
 
	ProductDAOImplementation pd = null;
	public ProductService() {
		pd = new ProductDAOImplementation();
	}
	
	public Product addProduct(Product p) {
		int i =pd.addBook(p);
		if(i == 1) {
		Product p1 = pd.getBook(p.getBcode());
		return p1;
		}
		else {
		return null;
		}
	}
	
	public Product deleteProduct(String bcode) {
		Product p = pd.getBook(bcode);
		int i = pd.deleteBook(bcode);
		if(i != 1) {
			p = null;
		}
		return p;
	}
	
	public Product getProduct(String bcodeortitle) {
		return pd.getBook(bcodeortitle);
	}
	
	public List<Product> getAllProducts(){
		return pd.getAllBooks();
	}
	
	public Product updateProduct(Product p,String bcode) {
		return pd.updateBook(p,bcode);
	}
	
	public List<Product> getSearchProducts(String bcodeortitle){
		return pd.getSearchBooks(bcodeortitle);
	}
}
