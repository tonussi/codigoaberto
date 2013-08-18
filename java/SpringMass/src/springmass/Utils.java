package springmass;

import java.util.Random;

public class Utils {
	public static final int DEBUG_NONE = 0;
	public static final int DEBUG_MIN = 1;
	public static final int DEBUG_MEDIUM = 2;
	public static final int DEBUG_MAX = 4;
	public static int debugSetting = DEBUG_NONE;

	// public static int debugSetting = DEBUG_MIN+DEBUG_MEDIUM+DEBUG_MAX;
	static public java.util.Random random = new Random(
			System.currentTimeMillis());

	/**
	 * tells whether the requested flag is on... note that
	 */
	static public boolean debug(int flag) {
		return 0 != (flag & debugSetting);
	}

	/**
	 * Prints the string to System.out but only when debugging.
	 */
	static public void println(String s) {
		if (debugSetting != DEBUG_NONE)
			System.out.println(s);
	}
}