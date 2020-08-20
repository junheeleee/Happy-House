package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.PollutionDto;

public interface PollutionDAO {
	public int getCount(String yearkey, String monthkey, String district);
	public List<PollutionDto> search(String yearkey, String monthkey, String district, Paging paging);
}
