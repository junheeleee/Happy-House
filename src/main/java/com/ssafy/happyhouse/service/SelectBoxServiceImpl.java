package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.SelectBoxDAO;
import com.ssafy.happyhouse.model.HouseInfoDTO;
import com.ssafy.happyhouse.model.SidoCodeDTO;

@Service
public class SelectBoxServiceImpl implements SelectBoxService {

	@Autowired
	private SelectBoxDAO mapper;

	@Override
	public ArrayList<SidoCodeDTO> selectSido() throws Exception {

		ArrayList<SidoCodeDTO> list = mapper.selectSido();
		return list;
	}

	@Override
	public ArrayList<SidoCodeDTO> selectGugun(String sido) throws Exception {
		ArrayList<SidoCodeDTO> list = mapper.selectGugun(sido);
		return list;
	}

	@Override
	public ArrayList<HouseInfoDTO> selectDong(String gugun) throws Exception {
		ArrayList<HouseInfoDTO> list = mapper.selectDong(gugun);
		return list;
	}

	@Override
	public ArrayList<HouseInfoDTO> selectApt(String dong) throws Exception {
		ArrayList<HouseInfoDTO> list = mapper.selectApt(dong);
		return list;
	}

	@Override
	public int getCount(String dong) throws Exception {
		return mapper.getCount(dong);

	}

}
