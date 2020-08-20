package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.data.AptListPage;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HouseInfo;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.service.HouseService;

@RestController
@RequestMapping("/main.do")
public class MainRestController {
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value="/")
	private ResponseEntity<AptListPage> search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = "/index.jsp";
		String[] types = request.getParameterValues("type");
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Paging paging = new Paging();
		paging.setPage(page);
		if(types == null) {
			types = new String[]{"0","1","2","3"};
		}
		paging.setTotalCount(houseService.getCount(types, key, word));
		List<HouseDeal> aptlist = houseService.search(types, key, word, paging);
		AptListPage data = new AptListPage();
		data.setAptlist(aptlist);
		data.setPaging(paging);
		data.setTypes(types);
		data.setKey(key);
		data.setWord(word);
		return new ResponseEntity<AptListPage>(data, HttpStatus.OK);
	}
	
	@RequestMapping("/click")
	private ResponseEntity<String> click(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("code"));
		
		String code = request.getParameter("code");
		String aptName = request.getParameter("aptName");
		HouseInfo houseInfo = houseService.click(code, aptName);
		String data = "";
		if(houseInfo != null && houseInfo.getImg() != null) {
			data = houseInfo.getImg();
		} else {
			data = "noimg.JPG";
		}
		
		return new ResponseEntity<String>(data, HttpStatus.OK);
	}
	@RequestMapping("/amount")
	private ResponseEntity<String> amount(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		String aptName = request.getParameter("aptName");
		String jibun = request.getParameter("jibun");
		HouseDeal housedeal = houseService.getAmount(aptName, jibun);
		String data = "";
		if(housedeal != null && housedeal.getDealAmount() != null) {
			data = housedeal.getDealAmount();
		} else {
			data = "거래가 가없습니다.";
		}
		
		return new ResponseEntity<String>(data, HttpStatus.OK);
	}
}
