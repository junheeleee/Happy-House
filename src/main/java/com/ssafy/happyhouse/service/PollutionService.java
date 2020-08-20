package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.PollutionDto;

public interface PollutionService {
	public int getCount(String yearkey, String monthkey, String gu);
	public List<PollutionDto> search(String yearkey, String monthkey, String gu, Paging paging);
}
