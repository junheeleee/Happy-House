package com.ssafy.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.IdCheckDAO;

@Service
public class IdCheckServiceImpl implements IdCheckService {

	@Autowired
	private IdCheckDAO mapper;

	@Override
	public int idCheck(String idFromAjax) throws Exception {
		int idCount = 0;
		idCount = mapper.idCheck(idFromAjax);
		return idCount;
	}//idCheck

}//class
