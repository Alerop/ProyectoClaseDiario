package modelo;

public class Jugador {
	private String nombre;
	private int dorsal;
	
	public Jugador(String nombre, int dorsal) {
		super();
		this.nombre = nombre;
		this.dorsal = dorsal;
	}
	
	public Jugador() {
		super();
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getDorsal() {
		return dorsal;
	}
	public void setDorsal(int dorsal) {
		this.dorsal = dorsal;
	}
}
