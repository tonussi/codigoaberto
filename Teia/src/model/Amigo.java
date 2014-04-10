package model;

import java.math.BigInteger;

import processing.core.PApplet;
import processing.core.PVector;

public class Amigo {

	private String uname, sex, localidade;
	private int agerank;
	private BigInteger uid;
	private PVector localizacao, direcao, aceleracao;
	PApplet parent;

	public Amigo(PApplet p, BigInteger uid, String uname, String sex,
			String localidade, int agerank) {

		parent = p;

		this.uid = uid;
		this.uname = uname;
		this.sex = sex;
		this.localidade = localidade;
		this.agerank = agerank;

		initVectors();
	}

	public void initVectors() {
		localizacao = new PVector(parent.random(parent.width / 2),
				parent.random(parent.height / 2));
		direcao = new PVector(parent.random(0.2F), parent.random(0.2F));
		aceleracao = new PVector(parent.random(0.2F), parent.random(0.2F));
	}

	public void mova() {
		localizacao.add(direcao);
		localizacao.add(aceleracao);
	}

	public void display() {
		parent.pushMatrix();
		parent.translate(localizacao.x, localizacao.y);
		parent.fill(0);
		parent.text(getLocalidade(), localizacao.x, localizacao.y);
		parent.text(getUname(), localizacao.x, localizacao.y);
		parent.fill(159, 78, 139);
		parent.ellipse(localizacao.x, localizacao.y, 10, 10);
		parent.popMatrix();
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public int getAgerank() {
		return agerank;
	}

	public void setAgerank(int agerank) {
		this.agerank = agerank;
	}

	public BigInteger getUid() {
		return uid;
	}

	public void setUid(BigInteger uid) {
		this.uid = uid;
	}

	public PVector getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(PVector localizacao) {
		this.localizacao = localizacao;
	}

	public PVector getDirecao() {
		return direcao;
	}

	public void setDirecao(PVector direcao) {
		this.direcao = direcao;
	}

	public PVector getAceleracao() {
		return aceleracao;
	}

}