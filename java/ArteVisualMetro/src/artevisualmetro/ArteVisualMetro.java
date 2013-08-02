package artevisualmetro;

import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PFont;

/**
 * Obra inspirada numa artevisual do metro de sampa
 * 
 * Linha 1-Azul - Estacao Santana
 * 
 * TITULO: Sem Titulo ARTISTA: Mauricio Nogueira Lima GENERO: Painel DATA: 1990
 * TECNICA: Pintura sobre placas de fibrocimento MATERIAL: Tinta acqua-cryl
 * DIMENSOES: 140 m2 PESO: LOCALIZACAO: Corredores de acesso aa plataforma
 * 
 * http://www.metro.sp.gov.br/cultura-lazer/arte-metro/arte-metro.aspx
 * 
 * @author Lucas Tonussi
 * 
 */

public class ArteVisualMetro extends PApplet {

	private ArrayList<Faixa> faixa;
	private Luz luz;
	private PFont font;
	private int off, on;
	int w, h, tamanho, op;

	@Override
	public void setup() {
		size(800, 450);
		if (frame != null) {
			frame.setResizable(true);
		}
		faixa = new ArrayList<Faixa>();
		for (int i = 0; i < width; i += 80)
			faixa.add(new Faixa(this, random(60, 130), height, i, 0));
		luz = new Luz(this, width - 120, -160, (width + height) / 2);
		faixa.add(new Faixa(this, width, 120, 0, height - 200, 0, 0, 0, 30));

		background(40);
		smooth();

		font = createFont("Ubuntu", 16, true);

		on = color(41, 50);
		off = color(255, 50);

		w = width;
		h = height;

		tamanho = 10;
	}

	@Override
	public void draw() {
		background(40);

		for (int index = 0; index < faixa.size(); index++) {
			faixa.get(index).display();
			luz.display(faixa.get(index));
		}

		switch (op) {
		case 685:
			break;
		case 705:
			break;
		case 725:
			break;
		case 745:
			break;
		case 765:
			break;
		case 785:
			break;
		default:
			break;
		}
		/**
		 * op = {685, 705, 725, 745, 765, 785}
		 */

		escolhas();
		resizecatch();
	}

	public void escolhas() {
		fill(255);
		textFont(font, 16);
		text("Arte Visual", width - (12 * tamanho), (height - (2.5f * tamanho)));
		stroke(off);
		strokeWeight(0.5f);
		for (int i = 0; i <= (tamanho / 2); i++) {
			if (mouseX == ((width - 20) - i * 20) + (tamanho / 2)
					&& (mouseY > height - (2.5f * tamanho) && mouseY < height
							+ (3 * tamanho))) {
				fill(on);
				op = ((width - 20) - i * 20) + (tamanho / 2);
				println(op);
			} else {
				op = 0;
				fill(off);
			}
			rect((width - (2 * tamanho)) - i * (2 * tamanho), height
					- (2 * tamanho), tamanho, tamanho);
		}
	}

	public void resizecatch() {
		if (w != width || h != height) {
			reCreate();
			w = width;
			h = height;
		}
	}

	private void reCreate() {
		faixa.clear();

		for (int i = 0; i < width; i += 80)
			faixa.add(new Faixa(this, random(60, 130), height, i, 0));
		luz = new Luz(this, width - 120, -160, (width + height) / 2);
		faixa.add(new Faixa(this, width, 120, 0, height - 200, 0, 0, 0, 30));
	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { artevisualmetro.ArteVisualMetro.class
				.getName() });
	}
}
