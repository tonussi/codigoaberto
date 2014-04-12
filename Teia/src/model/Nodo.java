package model;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import processing.core.PApplet;

public class Nodo {

	private BigInteger valor;
	private Set nodos;
	PApplet processing;

	public Nodo(PApplet processing, BigInteger valor, List<BigInteger> nodos) {
		this.processing = processing;
		this.valor = valor;
		this.nodos = new HashSet<BigInteger>(nodos);
	}

	public Set getNos() {
		return nodos;
	}

	public void setNos(Set nos) {
		nodos = nos;
	}

	public BigInteger getValor() {
		return valor;
	}

	public void setValor(BigInteger valor) {
		this.valor = valor;
	}

}
