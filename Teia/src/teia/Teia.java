package teia;

import java.util.ArrayList;
import java.util.List;

import model.Amigo;
import model.Aresta;
import model.Info;
import model.Nodo;
import processing.core.PApplet;
import processing.core.PFont;
import dao.AmigoDataAccessObject;

public class Teia extends PApplet {

	List<Amigo> amigos;
	List<Info> infos;
	List<Aresta> arestas;
	List<Nodo> nodos;
	AmigoDataAccessObject dao;
	PFont font;

	public Teia() {
		font = createFont("Monospace", 6);

		infos = new ArrayList<Info>();

		amigos = new ArrayList<Amigo>();

		dao = new AmigoDataAccessObject(this, font, "lucastonussi",
				"lucastonussi", "hung4ro5");

		infos = dao.listadeAmigos();

		for (Info info : infos)
			amigos.add(new Amigo(this, info));

	}

	@Override
	public void setup() {
		// size(3840, 2160);
		size(350, 350);
		translate(width / 2, height / 2);
	}

	@Override
	public void draw() {
		background(43);
		translate(width / 2, height / 2);
		for (Amigo amigo : amigos) {
			amigo.display();
			amigo.mova();
		}

	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { teia.Teia.class.getName() });
	}
}
