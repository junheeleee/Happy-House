package com.ssafy.happyhouse.model;

import java.util.Date;

public class PollutionDto {
	private int date;
	private String district;
	private float o2;
	private float ozon;
	private float carbon;
	private float sulfur;
	private float finedust;
	private float ultraFinedust;
	public int getPolluteDate() {
		return date;
	}
	public void setPolluteDate(int polluteDate) {
		this.date = polluteDate;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public float getO2() {
		return o2;
	}
	public void setO2(float o2) {
		this.o2 = o2;
	}
	public float getOzon() {
		return ozon;
	}
	public void setOzon(float ozon) {
		this.ozon = ozon;
	}
	public float getCarbon() {
		return carbon;
	}
	public void setCarbon(float carbon) {
		this.carbon = carbon;
	}
	public float getSulfur() {
		return sulfur;
	}
	public void setSulfur(float sulfur) {
		this.sulfur = sulfur;
	}
	public float getFinedust() {
		return finedust;
	}
	public void setFinedust(float finedust) {
		this.finedust = finedust;
	}
	public float getUltraFinedust() {
		return ultraFinedust;
	}
	public void setUltraFinedust(float ultraFinedust) {
		this.ultraFinedust = ultraFinedust;
	}
	@Override
	public String toString() {
		return "AirPollution [polluteDate=" + date + ", district=" + district + ", o2=" + o2 + ", ozon=" + ozon
				+ ", carbon=" + carbon + ", sulfur=" + sulfur + ", finedust=" + finedust + ", ultraFinedust="
				+ ultraFinedust + "]";
	}
	/*
	 * private String year; private String month; private String day; private String
	 * gu; private String co; private String so2; private String o3; private String
	 * no2; private String pm10; private String pm25; public PollutionDto(String
	 * year, String month, String day, String gu, String co, String so2, String o3,
	 * String no2, String pm10, String pm25) { super(); this.year = year; this.month
	 * = month; this.day = day; this.gu = gu; this.co = co; this.so2 = so2; this.o3
	 * = o3; this.no2 = no2; this.pm10 = pm10; this.pm25 = pm25; } public
	 * PollutionDto() { super(); // TODO Auto-generated constructor stub } public
	 * String getYear() { return year; } public void setYear(String year) {
	 * this.year = year; } public String getMonth() { return month; } public void
	 * setMonth(String month) { this.month = month; } public String getDay() {
	 * return day; } public void setDay(String day) { this.day = day; } public
	 * String getGu() { return gu; } public void setGu(String gu) { this.gu = gu; }
	 * public String getCo() { return co; } public void setCo(String co) { this.co =
	 * co; } public String getSo2() { return so2; } public void setSo2(String so2) {
	 * this.so2 = so2; } public String getO3() { return o3; } public void
	 * setO3(String o3) { this.o3 = o3; } public String getNo2() { return no2; }
	 * public void setNo2(String no2) { this.no2 = no2; } public String getPm10() {
	 * return pm10; } public void setPm10(String pm10) { this.pm10 = pm10; } public
	 * String getPm25() { return pm25; } public void setPm25(String pm25) {
	 * this.pm25 = pm25; }
	 */
	
	
}
