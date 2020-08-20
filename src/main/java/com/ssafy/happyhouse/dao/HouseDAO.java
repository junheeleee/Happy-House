package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HouseInfo;
import com.ssafy.happyhouse.model.Paging;
public interface HouseDAO {
	
	public List<HouseDeal> search(String types[], String key, String word, Paging paging) throws Exception;
	
	public List<HouseDeal> selectAll(Paging paging) throws Exception;
	
	public List<HouseInfo> getTopList() throws Exception;
	
	public HouseInfo click(String code, String aptName) throws Exception;
	
	public HouseDeal getAmount(String aptName, String jibun) throws Exception;
	
	public int getCount(String[] types, String key, String word) throws Exception;
	
	public int getAllCount() throws Exception;
	
	public int addCount(int no) throws Exception;
}
