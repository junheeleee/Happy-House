package com.ssafy.happyhouse.data;

import java.util.ArrayList;

import com.ssafy.happyhouse.model.HouseInfoDTO;
import com.ssafy.happyhouse.model.Paging;


public class AptInfoListPage {
	private ArrayList<HouseInfoDTO> list;
	private Paging paging;
	public ArrayList<HouseInfoDTO> getList() {
		return list;
	}
	public void setList(ArrayList<HouseInfoDTO> list) {
		this.list = list;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	@Override
	public String toString() {
		return "AptInfoListPage [list=" + list + ", paging=" + paging + "]";
	}
}
