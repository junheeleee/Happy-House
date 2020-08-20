package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import com.ssafy.happyhouse.model.HouseInfoDTO;
import com.ssafy.happyhouse.model.SidoCodeDTO;


public interface SelectBoxService {

	ArrayList<SidoCodeDTO> selectSido() throws Exception;

	ArrayList<SidoCodeDTO> selectGugun(String sido) throws Exception;

	ArrayList<HouseInfoDTO> selectDong(String gugun) throws Exception;

	ArrayList<HouseInfoDTO> selectApt(String dong) throws Exception;

	int getCount(String dong) throws Exception;
}
