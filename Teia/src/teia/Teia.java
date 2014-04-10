package teia;

import java.util.ArrayList;
import java.util.List;

import model.Amigo;
import processing.core.PApplet;
import dao.AmigoDataAccessObject;

@SuppressWarnings("serial")
public class Teia extends PApplet {

	List<Amigo> amigos;
	AmigoDataAccessObject amigodao;

	public Teia() {
		amigos = new ArrayList<Amigo>();
		amigodao = new AmigoDataAccessObject(this, "lucastonussi", "lucastonussi",
				"hung4ro5");
		System.out.println(amigodao.quantidadeAmigos());
		amigos = amigodao.listadeAmigos();
	}

	@Override
	public void setup() {
		size(350, 200);
		background(255);
		translate(width / 2, height / 2);
	}

	@Override
	public void draw() {
		background(255);
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
