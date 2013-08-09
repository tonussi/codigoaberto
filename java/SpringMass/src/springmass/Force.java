package springmass;

public abstract class Force {
	Space sp;
	double gval;
	double gmisc;
	boolean enable;

	Force(Space s, double v, double m) {
		sp = s;
		gval = v;
		gmisc = m;
		enable = false;
	}

	void setVal(double v) {
		gval = v;
	}

	void setMisc(double m) {
		gmisc = m;
	}

	void setEnable(boolean b) {
		enable = b;
	}

	double getVal() {
		return gval;
	}

	double getMisc() {
		return gmisc;
	}

	boolean getEnable() {
		return enable;
	}

	abstract void force();
}