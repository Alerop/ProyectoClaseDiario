package eshop.beans;

public class CartItem {
/*  private String author;
  private String title;
  private double price;
  private String bookID;*/
  private Book book; //se trae de Book
  //private String quantity;
  private Integer quantity;

	public CartItem(Book book, int quantity) {
		/*bookID = book.getId();
		title = book.getTitle();
		author = book.getAuthor();
		price = book.getPrice();*/
		this.book=book;
		this.quantity = quantity;
	  }

	
	
	public Book getBook() {return book;}
	public void setBook(Book book) {this.book = book;}

	public int getQuantity() {return quantity;}
	public void setQuantity(Integer quantity) {this.quantity = quantity;}


	/*public String getAuthor() { return book.getAuthor(); }
	public void setAuthor(String author) { this.book.setAuthor(author); }

	public String getTitle() { return book.getTitle(); }
	public void setTitle(String title) { this.book.setTitle(title); }

	public double getPrice() { return book.getPrice(); }
	public void setPrice(double price) { this.book.setPrice(price); }

	public String getBookID() { return book.getId(); }
	public void setBookId(String bookID) { this.book.setId(bookID); }*/

	


  }
