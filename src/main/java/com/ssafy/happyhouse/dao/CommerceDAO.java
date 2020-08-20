package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.model.Commerce;
import com.ssafy.happyhouse.model.CommerceInfo;
import com.ssafy.happyhouse.model.Paging;

public interface CommerceDAO {

	public List<Commerce> selectAll(String interestArea);
	
	public List<Commerce> search(String key, String word, String interestArea, Paging paging);
	
	public int getCount(String key, String word, String interestArea);
	
	public String getGu(String interestArea);
}
