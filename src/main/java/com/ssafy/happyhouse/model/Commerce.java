package com.ssafy.happyhouse.model;

public class Commerce {
	private String shopname;
	private String codename1;
	private String codename3;
	private String address;

	public Commerce() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Commerce(String shopname, String codename1, String codename3, String address) {
		super();
		this.shopname = shopname;
		this.codename1 = codename1;
		this.codename3 = codename3;
		this.address = address;
	}
	public String getCodename1() {
		return codename1;
	}
	public void setCodename1(String codename1) {
		this.codename1 = codename1;
	}
	public String getCodename3() {
		return codename3;
	}
	public void setCodename3(String codename3) {
		this.codename3 = codename3;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
