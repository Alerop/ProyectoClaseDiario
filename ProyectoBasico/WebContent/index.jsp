<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  	<%@ page import="java.util.HashMap, java.util.ArrayList, modelo.Jugador" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProyectoBasico_Prueba</title>
</head>
<body>

	<% //response.sendRedirect("Hola?x=321&y=654"); %><!-- Decir que va a ejecutar codigo java -->
	<div>Hola Mundo!!</div>
	<!-- <div>
		<form name="Pepi" method="post" action="Hola">
			<div>
				<div>
					<label for="X">X:</label>
        			<input type="text" name="x" /><!-- el name es la puta clave, creeme --
				</div>
				<div>
        			<label for="Y">Y:</label>
       				<input type="text" name="y" />
       			</div>
       			<div class="button">
        			<input type="submit" value="Enviar">
   				</div>
       		</div>
		</form>
	</div>-->
	<%
		/* String[] equipos={"RMA","BCN","ATM"};
		//OBJETOS PREDEFINIDOS EN JSP: response,request,session,...
		response.getWriter().write("<OL>");
		for(int i=0;i<equipos.length;i++){
			response.getWriter().write("<LI>"+equipos[i]);
		}
		response.getWriter().write("</OL>");
	 */
	 
	 HashMap<String,ArrayList<Jugador>> clubs = request.;
	%>
</body>
</html>