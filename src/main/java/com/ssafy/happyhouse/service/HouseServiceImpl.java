package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.dao.HouseDAO;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HouseInfo;
import com.ssafy.happyhouse.model.HousePageBean;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseDAO mapper;

	public List<HouseDeal> search(String[] types, String key, String word, Paging paging) throws Exception{
		try {
			if(types.length == 0) {
				throw new HappyHouseException("주택타입은 반드시 한개 이상을 선택해야합니다.");
			}
			return mapper.search(types, key, word, paging);
		} catch (Exception e) {
			throw new HappyHouseException("주택 정보 조회중 오류 발생");
		}
	}
	
	public List<HouseDeal> selectAll(Paging paging) throws Exception{
		List<HouseDeal> list;
		try {
			list = mapper.selectAll(paging);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public HouseInfo click(String code, String aptName) throws Exception{
		try {
			HouseInfo houseInfo = mapper.click(code, aptName);
			return houseInfo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public int getCount(String[] types, String key, String word) throws Exception{
		try {
			return mapper.getCount(types, key, word);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}


	@Override
	public int getAllCount() throws Exception{
		try {
			return mapper.getAllCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int addCount(int no) throws Exception {
		return mapper.addCount(no);
	}

	@Override
	public List<HouseInfo> getTopList() throws Exception {
		return mapper.getTopList();
	}

	@Override
	public HouseDeal getAmount(String aptName, String jibun) throws Exception {
		return mapper.getAmount(aptName, jibun);
	}

	

}




