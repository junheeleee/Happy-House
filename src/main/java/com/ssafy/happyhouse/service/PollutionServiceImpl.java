package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.PollutionDAO;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.PollutionDto;

@Service
public class PollutionServiceImpl implements PollutionService{

	@Autowired
	private PollutionDAO dao;
	
	@Override
	public int getCount(String yearkey, String monthkey, String gu) {
		return dao.getCount(yearkey, monthkey,gu);
	}
	@Override
	public List<PollutionDto> search(String yearkey, String monthkey, String gu, Paging paging) {
		return dao.search(yearkey, monthkey, gu, paging);
	}
	
}
