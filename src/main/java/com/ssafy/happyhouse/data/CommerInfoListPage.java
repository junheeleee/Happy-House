package com.ssafy.happyhouse.data;

import java.util.List;

import com.ssafy.happyhouse.model.Commerce;
import com.ssafy.happyhouse.model.Paging;

public class CommerInfoListPage {
	private List<Commerce> list;
	private Paging paging;
	private String key;
	private String word;
	public List<Commerce> getList() {
		return list;
	}
	public void setList(List<Commerce> list) {
		this.list = list;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
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
	
}
