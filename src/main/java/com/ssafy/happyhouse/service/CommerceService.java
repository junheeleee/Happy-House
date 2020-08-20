package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.Commerce;
import com.ssafy.happyhouse.model.CommerceInfo;
import com.ssafy.happyhouse.model.Paging;


public interface CommerceService {
	
	public List<Commerce> search(String key, String word, String interestArea, Paging paging);
	
	public List<Commerce> selectAll(String interestArea);
	
	public int getCount(String key, String word, String interestArea);
	
	public String getGu(String interestArea);
}
