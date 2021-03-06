package eshop.model;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Enumeration;
import java.util.HashMap;
import java.sql.SQLException;
import java.sql.Statement;

import eshop.beans.Book;
import eshop.beans.CartItem;

public class OrderDetailsPeer {

  public static void insertOrderDetails1(Statement stmt, long orderId,
      Hashtable<String, CartItem> shoppingCart) throws SQLException {
    String sql;
    Enumeration<CartItem> enumList = shoppingCart.elements();
    while (enumList.hasMoreElements()) {
      CartItem item = enumList.nextElement();
      sql = "insert into order_details (order_id, book_id, quantity,"
          + " price, title, author) values ('" + orderId + "','"
          + item.getBook().getId() + "','" + item.getQuantity() + "','"
          + item.getBook().getPrice() + "','" + item.getBook().getTitle() + "','"
          + item.getBook().getAuthor() + "')"
          ;
      stmt.executeUpdate(sql);
      }
    }
  public static void insertOrderDetails(Statement stmt, long orderId,
	      HashMap<String, CartItem> shoppingCart) throws SQLException {
	    String sql;
	    Iterator<CartItem> enumList = shoppingCart.values().iterator();

	    while (enumList.hasNext()) {
	      CartItem item = enumList.next();
	      sql = "insert into order_details (order_id, book_id, quantity,"
	          + " price, title, author) values ('" + orderId + "','"
	          + item.getBook().getId() + "','" + item.getQuantity() + "','"
	          + item.getBook().getPrice() + "','" + item.getBook().getTitle() + "','"
	          + item.getBook().getAuthor() + "')"
	          ;
	      stmt.executeUpdate(sql);
	      }
	    }
  }
