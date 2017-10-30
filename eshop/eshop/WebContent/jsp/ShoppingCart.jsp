<%@page language="java" contentType="text/html"%>
<%@page import="java.util.HashMap" %>
<%@page import="eshop.beans.Book"%>
<%@page import="eshop.beans.CartItem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<%
  String base = (String) application.getAttribute("base");
  @SuppressWarnings("unchecked")
  
 HashMap<String,CartItem> shoppingCart = (HashMap<String, CartItem>)session.getAttribute("shoppingCart");
 	/*Hashtable<String, CartItem> shoppingCart1 =
      (Hashtable<String, CartItem>)session.getAttribute("shoppingCart");*/
  if (shoppingCart == null) {
    shoppingCart = new HashMap<String, CartItem>(10);
   // shoppingCart = new Hashtable<String,CartItem>(10);
  }
 // String action = request.getParameter("action");
  //additem esta mal definido en el servlet
  /*if (action != null && action.equals("addItem")) {
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
    }*/
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
          <%-- <c:forEach var="item"items="${sessionScope['shoppingCart']}"></c:forEach> --%>
          <%-- <c:forEach var="item" items="${sessionScope.shoppingCart}"></c:forEach> --%>
		  <%-- <c:forEach var="item" items="${carrito}"></c:forEach> --%> 
          <c:set var="totalprice" scope="session" value="0"></c:set>
          <c:forEach var="item" items="${shoppingCart}">
          
          
<%--
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
          
  --%>
          <tr>
            <td><c:out value="${item.value.getBook().getTitle()}"></c:out><%--=item.getBook().getTitle()--%></td>
            <td><c:out value="${item.value.getBook().getAuthor()}"></c:out><%--=item.getBook().getAuthor()--%></td>
            <td><c:out value="${item.value.getBook().getPrice()}"></c:out><%--=item.getBook().getPrice()--%></td>
            <td><form>
            
              <input type="hidden" name="action" value="updateItem"/>
              <input type="hidden" name="bookId"
                value="<c:out value="${item.value.getBook().getId()}"></c:out><%--=item.getBook().getId()--%>"/>
              <input type="text" size="2" name="quantity" 
                value="<c:out value="${item.value.getQuantity()}"></c:out><%--=item.getQuantity()--%>"/>
              <input type="submit" value="Update"/>
              </form></td>
            <td>
            <c:set var="cantidad" value="${item.value.getQuantity()}"></c:set>
            <c:set var="precio" value="${item.value.getBook().getPrice()}"></c:set>
            <c:set var="subtotal" scope="session" value="${subtotal+(cantidad*precio) }"></c:set>
            <c:out value="${precio}"/><!-- imprimir el precio por pantalla en este td que es el correcpondiente al subtotal -->
            <c:set var="totalprice" scope="session" value="${totalprice + subtotal}"></c:set>
              <%--=itemPrice--%>
                </td>
            <td><form>
              <input type="hidden" name="action" value="deleteItem"/>
              <input type="hidden" name="bookId" 
                value="<c:out value="${item.value.getBook().getId()}"></c:out><%--=item.getBook().getId()--%>"/>
              <!-- <input type="submit" value="Delete"/> -->
              <c:set var="linkesito" value="http://localhost:8080/eshop/shop?action=deleteItem&bookId="></c:set>
              <c:set var="urlbook" value="${item.value.getBook().getId()}"/>
              <c:set var="fin" value="${stat.first ? '' : linkesito}${urlbook }"/>
              <!--  <a class="link1" href="<%-- out.write(var.concat(item.getBook().getId()));--%>">Borráte</a>-->
              <a class="link1" href="<c:out value="${fin}"/>" >BorráteJSTL</a>
              </form></td>
            </tr>
            </c:forEach>
            
<%--
          }
  --%>
        <tr>
          <td colspan="5" id="total">Total: $${totalprice}</td>
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
