package com.ssafy.happyhouse.dao;

import java.util.ArrayList;

import com.ssafy.happyhouse.model.HouseInfoDTO;
import com.ssafy.happyhouse.model.SidoCodeDTO;

public interface SelectBoxDAO {
	ArrayList<SidoCodeDTO> selectSido();

	ArrayList<SidoCodeDTO> selectGugun(String sido);

	ArrayList<HouseInfoDTO> selectDong(String gugun);

	ArrayList<HouseInfoDTO> selectApt(String dong);
	
	int getCount(String dong) throws Exception;
}
