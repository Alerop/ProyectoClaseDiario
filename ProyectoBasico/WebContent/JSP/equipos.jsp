<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.HashMap, java.util.ArrayList, java.util.Set, java.util.Collection, modelo.Jugador"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		//response.sendRedirect("Hola?x=321&y=654");
	%><!-- Decir que va a ejecutar codigo java -->

	<div>CONSULTA DE JUGADORES</div>
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
		//esto es lo mismo que (int) 25
		HashMap<String, ArrayList<Jugador>> clubs = (HashMap<String, ArrayList<Jugador>>) request
				.getAttribute("equipos");
		//casting porque devuelve un objeto
	%>

	<div>
		<form method="post" action="">
			<div>
				<select name="club">

					<%
						//obtener claves del hashmap, basicamente nombres de equipos
						Set<String> claves = clubs.keySet();
						String equipoElegido = (String) request.getAttribute("equipoElegido");
						for (String clave : claves) {
							String checked = clave.equals(equipoElegido) ? "selected" : "";
							out.println("<option ");
							out.println(checked);
							out.println("value=\"" + clave + "\">" + clave + "</option>");
						}
					%>


				</select> <input type="submit" value="Enviar" name="boton" />
			</div>
			<div></div>
		</form>
		<%
			if (request.getParameter("club") != null) {//primera vez ?
				out.print("<ul>");
				ArrayList<Jugador> listaJugadores = (ArrayList<Jugador>) request.getAttribute("seleccionados");

				for (Jugador jugador : listaJugadores) {
					out.print("<li>" + jugador.getNombre() + "</li>");
				}
				out.print("</ul>");
			}
		%>
	</div>


</body>
</html>