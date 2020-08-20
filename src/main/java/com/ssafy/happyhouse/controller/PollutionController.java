package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.PollutionDto;
import com.ssafy.happyhouse.service.CommerceService;
import com.ssafy.happyhouse.service.PollutionService;

@Controller
@RequestMapping("/pollution.do")
public class PollutionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Autowired
	private PollutionService pollutionService;
	@Autowired
	private CommerceService commerceService;
	
	@RequestMapping(value = "/search")
	private String search(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam String district) throws ServletException, IOException {
		System.out.println(district);
		String path = "/pollution/list.jsp";
		String yearkey = request.getParameter("yearkey");
		String monthkey = request.getParameter("monthkey");
		if(district==null) {
			district="도봉구";
		}
		if(yearkey == null) {
			yearkey = "2018";
			monthkey = "1";
		}
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}

		Paging paging = new Paging();
		paging.setPage(page);
		paging.setTotalCount(pollutionService.getCount(yearkey, monthkey, district));
		List<PollutionDto> list = pollutionService.search(yearkey, monthkey, district, paging);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("yearkey", yearkey);
		request.setAttribute("monthkey", monthkey);
		request.setAttribute("district", district);
		return "pollution/list";
	}
}
