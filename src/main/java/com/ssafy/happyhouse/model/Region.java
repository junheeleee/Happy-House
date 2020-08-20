package com.ssafy.happyhouse.model;

public class Region {
	private int code;
	private String sido;
	private String sigungu;
	private String dong;

	public Region() {
		super();
	}
	public Region(int code, String sido, String sigungu, String dong) {
		super();
		this.code = code;
		this.sido = sido;
		this.sigungu = sigungu;
		this.dong = dong;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	
}
