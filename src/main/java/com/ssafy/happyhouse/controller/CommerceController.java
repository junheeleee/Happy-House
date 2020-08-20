package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.data.CommerInfoListPage;
import com.ssafy.happyhouse.model.Commerce;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.service.CommerceService;


@RestController
@RequestMapping("/commerce")
public class CommerceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CommerceService commerceService;

	@RequestMapping("/search")
	   protected ResponseEntity<CommerInfoListPage> dong(HttpSession session, Model model, @RequestParam(required = false, defaultValue = "shopname") String key, @RequestParam(required = false, defaultValue = "") String word, @RequestParam(required = false, defaultValue = "") String interestArea,@RequestParam(required = false, defaultValue = "1") int page) throws ServletException, IOException {
		if(key == null) {
			key = "shopname";
			word = "";
		}
		if(page == 0) {
			page = 1;
		}
		CommerInfoListPage data = new CommerInfoListPage();
		Paging paging = new Paging();
		paging.setPage(page);
		paging.setTotalCount(commerceService.getCount(key, word, interestArea));
		List<Commerce> list = commerceService.search(key, word, interestArea, paging);
	    data.setList(list);
	    data.setPaging(paging);
		data.setKey(key);
		data.setWord(word);
	      return new ResponseEntity<CommerInfoListPage>(data, HttpStatus.OK);
	   }//process
}
