package com.ssi.utility;

public class Product {
	private String bcode;
	private String title;
	private String author;
	private String subject;
	private String price;
	
	
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Product(String bcode, String title, String author, String subject, String price) {
		super();
		this.bcode = bcode;
		this.title = title;
		this.author = author;
		this.subject = subject;
		this.price = price;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [bcode=" + bcode + ", title=" + title + ", author=" + author + ", subject=" + subject
				+ ", price=" + price + "]";
	}
	
	
}
