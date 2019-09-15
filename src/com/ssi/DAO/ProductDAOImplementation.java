package com.ssi.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import com.ssi.utility.Product;

public class ProductDAOImplementation extends HttpServlet implements ProductDAO{

	private static final long serialVersionUID = 1L;
	private Connection con;
	
	public ProductDAOImplementation() {
		try{
       	 Class.forName("oracle.jdbc.driver.OracleDriver");
       	 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","abc123","abc123");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int addBook(Product p) {
		int i=0;
		String sql = "insert into books(bcode,title,author,subject,price) values(?,?,?,?,?)";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, p.getBcode());
			stmt.setString(2, p.getTitle());
			stmt.setString(3, p.getAuthor());
			stmt.setString(4, p.getSubject());
			stmt.setString(5, p.getPrice());
			i = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
		
	}
	
	@Override
	public int deleteBook(String bcode) {
		
		int i = 0;
		try {
			String sql = "delete from books where bcode='"+bcode+"'";
			PreparedStatement pstmt = con.prepareStatement(sql);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	@Override
	public List<Product> getAllBooks(){
		List<Product> plist = null;
		String sql = "Select bcode,title,author,subject,price from books";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			if(rs.getFetchSize()>0) {
				plist  = new ArrayList<Product>();
				while(rs.next()) {
					Product p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
					plist.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	@Override
	public Product updateBook(Product p,String bcode) {
		int success=0;
		
		String sql="update books set bcode=?, title=?, author=?, subject=?, price=? where bcode=?"; 
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, p.getBcode());
			
			stmt.setString(2, p.getTitle());
			
			stmt.setString(3, p.getAuthor());
			
			stmt.setString(4, p.getSubject());
			
			stmt.setString(5, p.getPrice());
			
			stmt.setString(6, bcode);
			success = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(success == 0) {
		p = null;
		}
		
		return p;
	}
	
	@Override
	public Product getBook(String bcode) {
		
		Product p = null;
		String sql = "select bcode,title,author,subject,price from books where bcode=?"; 
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, bcode);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
			p = new Product();
			p.setBcode(rs.getString(1));
			p.setTitle(rs.getString(2));
			p.setAuthor(rs.getString(3));
			p.setSubject(rs.getString(4));
			p.setPrice(rs.getString(5));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	@Override
	public List<Product> getSearchBooks(String bcodeortitle){
		List<Product> plist = null;
		String sql = "Select bcode,title,author,subject,price from books where lower(bcode) like'"+bcodeortitle.toLowerCase()+"%' or lower(title) like'%"+bcodeortitle.toLowerCase()+"%'";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.getFetchSize()>0) {
				plist  = new ArrayList<Product>();
				while(rs.next()) {
					Product p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
					plist.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}
}
