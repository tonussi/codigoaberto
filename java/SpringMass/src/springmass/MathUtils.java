package springmass;

public class MathUtils {
	// Sets r to be the intersection of the two rectangles
	// and returns true if the result is non empty.
	// Best of all, it allocates no new objects!
	private boolean nodeIntersect(Node r, Node b) {
		float left = (r.x > b.x) ? r.x : b.x;
		float top = (r.y > b.y) ? r.y : b.y;
		float right = (r.x + r.width < b.x + b.width) ? r.x + r.width : b.x
				+ b.width;
		float bottom = (r.y + r.height < b.y + b.height) ? r.y + r.height : b.y
				+ b.height;
		r.x = left;
		r.y = top;
		r.width = right - left;
		r.height = bottom - top;
		return (r.width > 0 && r.height > 0);
	}

	/**
	 * Solves A x = b, using Gaussian Elimination with Backward Substitution,
	 * where A is an n by n+1 augmented matrix with last column being b. Based
	 * on algorithm 6.1 in Numerical Analysis, 6th edition by Burden & Faires,
	 * page 358.
	 */
	static public void matrixSolve(double[][] A, double[] x) {
		int n = x.length;
		int[] nrow = new int[n];
		for (int i = 0; i < n; i++)
			nrow[i] = i;
		for (int i = 0; i < n - 1; i++) { // elimination process
			// let p be the smallest integer with i <= p <= n and
			// A[nrow[p], i] = max(i<=j<=n) A[nrow[j], i]
			int p = i;
			double max = Math.abs(A[nrow[p]][i]);
			for (int j = i + 1; j < n; j++)
				if (Math.abs(A[nrow[j]][i]) > max) {
					max = Math.abs(A[nrow[j]][i]);
					p = j;
				}
			// If A[nrow[p]][i] == 0, then no solution
			if (A[nrow[p]][i] == 0)
				throw new IllegalStateException(
						"matrixSolve: no unique solution exists");
			if (nrow[i] != nrow[p]) { // simulated row interchange
				int ncopy = nrow[i];
				nrow[i] = nrow[p];
				nrow[p] = ncopy;
			}
			for (int j = i + 1; j < n; j++) {
				double m = A[nrow[j]][i] / A[nrow[i]][i];
				// do a row operation
				for (int k = 0; k < n + 1; k++)
					A[nrow[j]][k] -= m * A[nrow[i]][k];
			}
		}
		if (A[nrow[n - 1]][n - 1] == 0)
			throw new IllegalStateException(
					"matrixSolve: no unique solution exists");
		// start backward substitution
		x[n - 1] = A[nrow[n - 1]][n] / A[nrow[n - 1]][n - 1];
		for (int i = n - 2; i >= 0; i--) {
			double sum = 0;
			for (int j = i + 1; j < n; j++)
				sum += A[nrow[i]][j] * x[j];
			x[i] = (A[nrow[i]][n] - sum) / A[nrow[i]][i];
		}
	}
}
