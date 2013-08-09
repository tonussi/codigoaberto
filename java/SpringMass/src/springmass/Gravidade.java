package springmass;

import processing.core.PConstants;

class Gravity extends Force {
	final static double radian = PConstants.PI / 180.0;
	double gx, gy;

	Gravity(Space s, double v, double m) {
		super(s, v, m);
		update();
	}

	@Override
	void setVal(double v) {
		super.setVal(v);
		update();
	}

	@Override
	void setMisc(double m) {
		super.setMisc(m);
		update();
	}

	private void update() {
		gx = gval * Math.sin(gmisc * radian);
		gy = gval * Math.cos(gmisc * radian);
	}

	@Override
	void force() {
	}

}
