<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Collection" %>
<%@page import="java.util.Collections" %>
<%@page import="eshop.beans.Book"%>
<%@page import="eshop.beans.CartItem"%>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<%
  String base = (String) application.getAttribute("base");
  @SuppressWarnings("unchecked")
  
 /* HashMap<String,CartItem> shoppingCart1 = (HashMap<String, CartItem>)session.getAttribute("shoppingCart");*/
 	Hashtable<String, CartItem> shoppingCart =
      (Hashtable<String, CartItem>)session.getAttribute("shoppingCart");
  if (shoppingCart == null) {
    //shoppingCart = new HashMap<String, CartItem>(10);
    shoppingCart = new Hashtable<String,CartItem>(10);
  }
  String action = request.getParameter("action");
  //additem esta mal definido en el servlet
  if (action != null && action.equals("addItem")) {
    try {
      String bookId = request.getParameter("bookId");
      Book book = dataManager.getBookDetails(bookId);
      if (book != null) {
        CartItem item = new CartItem(book, 1);
        shoppingCart.remove(bookId);
        shoppingCart.put(bookId, item);
        session.setAttribute("shoppingCart", shoppingCart);
        }
      }
    catch (Exception e) {
      out.println("Error adding the selected book to the shopping cart!");
      }
    }
  /*if (action != null && action.equals("updateItem")) {
    try {
      String bookId = request.getParameter("bookId");
      String quantity = request.getParameter("quantity");
      CartItem item = shoppingCart.get(bookId);
      if (item != null) {
        item.setQuantity(quantity);
        }
      }
    catch (Exception e) {
      out.println("Error updating shopping cart!");
      }
    }*/
  /*if (action != null && action.equals("deleteItem")) {
    try {
      String bookId = request.getParameter("bookId");
      shoppingCart.remove(bookId);
      }
    catch (Exception e) {
      out.println("Error deleting the selected item from the shopping cart!");
      }
    }*/
  %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Shopping Cart</title>
  <link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<%
  if (!shoppingCart.isEmpty()) {
  %>
    <div class="content">
      <h2>Shopping Cart</h2>
      <table>
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Subtotal</th>
          <th>Delete</th>
          </tr>
<%
		/*Collections<CartItem> c = shoppingCart;
        Enumeration<CartItem> enumList1 = shoppingCart.colec;*/
		Enumeration<CartItem> enumList = shoppingCart.elements();
        double itemPrice = 0;
        double totalPrice = 0;
        double totalPriceRed=0;
        String var= "http://localhost:8080/eshop/shop?action=deleteItem&bookId=";

        while (enumList.hasMoreElements()) {
          CartItem item = enumList.nextElement();
          itemPrice = Math.round(
        		    //Integer.parseInt(item.getQuantity())
        		    item.getQuantity()
        		    * item.getBook().getPrice() * 100.) / 100.
                    ;
          totalPrice += itemPrice;
          totalPriceRed=Math.round(totalPrice * 100d)/100d;
          
  %>
          <tr>
            <td><%=item.getBook().getTitle()%></td>
            <td><%=item.getBook().getAuthor()%></td>
            <td><%=item.getBook().getPrice()%></td>
            <td><form>
            
              <input type="hidden" name="action" value="updateItem"/>
              <input type="hidden" name="bookId"
                value="<%=item.getBook().getId()%>"/>
              <input type="text" size="2" name="quantity" 
                value="<%=item.getQuantity()%>"/>
              <input type="submit" value="Update"/>
              </form></td>
            <td>
              <%=itemPrice%>
                </td>
            <td><form>
              <input type="hidden" name="action" value="deleteItem"/>
              <input type="hidden" name="bookId" 
                value="<%=item.getBook().getId()%>"/>
              <!-- <input type="submit" value="Delete"/> -->
              <a class="link1" href="<% out.write(var.concat(item.getBook().getId()));%>">Borr�te</a>
              </form></td>
            </tr>
<%
          }
  %>
        <tr>
          <td colspan="5" id="total">Total: $<%=totalPriceRed%></td>
          <td class="total">&nbsp;</td>
          </tr>
        <tr>
          <td colspan="6" class="center"><a class="link1"
            href="<%=base%>?action=checkOut">Check Out</a></td>
          </tr>
        </table>
      </div>
<%
    }
  else {
    %><p class="info">The Shopping cart is empty.</p><%
    }
  %>
</body>
</html>
