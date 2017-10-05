package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Set;
import java.util.ArrayList;
import java.util.Collection;

import modelo.Jugador;

/**
 * Servlet implementation class Bienvenida
 */
// @WebServlet("/Hola") //anotación, cambio de nombre de servidor
public class Bienvenida extends HttpServlet {// clase de herencia de HttpServlet
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Bienvenida() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// String param1 = request.getParameter("x");
		// String param2 = request.getParameter("y");
		// response.getWriter().append("Parametros: x: " + param1 + " y: " +
		// param2);//.append(request.getContextPath());

		// declaración de un hashmap de string y arraylist<jugador>
		HashMap<String, ArrayList<Jugador>> clubs = new HashMap<String, ArrayList<Jugador>>();

		// crear arralist de los jugadores
		// jugadores madrid
		ArrayList<Jugador> jugadores = new ArrayList<>();
		jugadores.add(new Jugador("Casillas", 1));
		jugadores.add(new Jugador("Albiol", 18));
		jugadores.add(new Jugador("Marcelo", 12));
		jugadores.add(new Jugador("Pepe", 3));
		jugadores.add(new Jugador("SergioRamos", 4));
		jugadores.add(new Jugador("DiMaria", 22));
		jugadores.add(new Jugador("Khedira", 6));
		jugadores.add(new Jugador("XaviAlonso", 14));

		clubs.put("Real Madrid", jugadores);

		// jugadores barcelona
		jugadores = new ArrayList<>();
		jugadores.add(new Jugador("Valdes", 1));
		jugadores.add(new Jugador("JordiAlba", 18));
		jugadores.add(new Jugador("Messi", 10));
		jugadores.add(new Jugador("CescFabregas", 4));
		jugadores.add(new Jugador("Pedro", 17));
		jugadores.add(new Jugador("Pique", 3));
		jugadores.add(new Jugador("SergiBusquets", 16));

		clubs.put("Barcelona FC", jugadores);// cargarlo en el hasmap

		// jugadores AtleticoMadrid
		jugadores = new ArrayList<>();// se realiza con jugadroes ya q
										// previamente se guardan en el HashMap
		jugadores.add(new Jugador("SergioAsenjo", 1));
		jugadores.add(new Jugador("FelipeLuis", 3));
		jugadores.add(new Jugador("Juanfran", 20));
		jugadores.add(new Jugador("Silvio", 17));
		jugadores.add(new Jugador("Emre", 21));
		jugadores.add(new Jugador("Gabi", 14));
		jugadores.add(new Jugador("Koke", 6));
		jugadores.add(new Jugador("Falcao", 9));

		clubs.put("Atlético Madrid", jugadores);

		// estableciendo atributo a doget
		request.setAttribute("equipos", clubs);

		if (request.getParameter("club") != null) {// priemra vez?
			request.setAttribute("equipoElegido", request.getParameter("club"));
			String equipoSeleccionado = request.getParameter("club");
			ArrayList<Jugador> listaJugadores = clubs.get(equipoSeleccionado);
			// estableciento atributo
			request.setAttribute("seleccionados", listaJugadores);
		}

		// como le cede el control el server al jsp
		request.getRequestDispatcher("/JSP/equipos.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

	@Override
	public void init() throws ServletException {// se ejecuta cuando se cede el
												// control al servlet
		System.out.println("Ejecutando método init");// para comprobar q se
														// ejecuta
		super.init();
	}

}
