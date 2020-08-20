package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.CommerceDAO;
import com.ssafy.happyhouse.model.Commerce;
import com.ssafy.happyhouse.model.CommerceInfo;
import com.ssafy.happyhouse.model.Paging;


@Service
public class CommerceServiceImpl implements CommerceService{
	
	@Autowired
	private CommerceDAO dao;
	
	@Override
	public List<Commerce> search(String key, String word, String interestArea, Paging paging){
			return dao.search(key, word, interestArea, paging);

	}
	
	@Override
	public List<Commerce> selectAll(String interestArea){
		List<Commerce> list;
		try {
			list = dao.selectAll(interestArea);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public int getCount(String key, String word, String interestArea) {
		return dao.getCount(key, word, interestArea);
	}
	
	@Override
	public String getGu(String interestArea) {
		return dao.getGu(interestArea);
	}
}
