package com.ssafy.happyhouse.data;

import java.util.Arrays;
import java.util.List;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.Paging;


public class AptListPage {
	private List<HouseDeal> aptlist;
	private Paging paging;
	private String[] types;
	private String key;
	private String word;
	public List<HouseDeal> getAptlist() {
		return aptlist;
	}
	public void setAptlist(List<HouseDeal> aptlist) {
		this.aptlist = aptlist;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	public String[] getTypes() {
		return types;
	}
	public void setTypes(String[] types) {
		this.types = types;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	@Override
	public String toString() {
		return "AptListPage [aptlist=" + aptlist + ", paging=" + paging + ", types=" + Arrays.toString(types) + ", key="
				+ key + ", word=" + word + "]";
	}
}
