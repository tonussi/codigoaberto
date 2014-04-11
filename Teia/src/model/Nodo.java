package model;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;

public class Nodo {

	private BigInteger valor;
	private Set nos;

	public Nodo(BigInteger valor, HashSet<BigInteger> nos) {
		super();
		this.valor = valor;
		this.nos = nos;
	}

	public Set getNos() {
		return nos;
	}

	public void setNos(Set nos) {
		this.nos = nos;
	}

	public BigInteger getValor() {
		return valor;
	}

	public void setValor(BigInteger valor) {
		this.valor = valor;
	}

}
