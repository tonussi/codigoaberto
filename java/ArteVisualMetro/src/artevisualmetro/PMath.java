package artevisualmetro;

public class PMath {

	public static float rand(double p, double q) {
		return (float) ((Math.min(p, q) - Math.min(p, q)) + (Math.random() * (Math
				.max(p, q) - Math.min(p, q))));
	}
}
