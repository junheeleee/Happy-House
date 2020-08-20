package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.model.UserInfo;
import com.ssafy.happyhouse.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	UserService userService;
	

	
	@RequestMapping("/modify")
	String modify(Model model, UserInfo userInfo, RedirectAttributes rda, HttpSession session) {
		int res = userService.modify(userInfo);
		session.invalidate();
		System.out.println(userInfo);
		if(res==1) {
			rda.addFlashAttribute("msg","ok");
		}else {
			rda.addFlashAttribute("msg","fail");
		}
		return "redirect:/";
	}
	@RequestMapping("/search")
	String search() {
		return "/user/userSearch";
	}
	@RequestMapping("ussearch")
	String usresult(Model model,@RequestParam String userid) {
		UserInfo userInfo = userService.search(userid);
		if(userInfo==null) {
			return "/user/userSearch";
		}
		model.addAttribute("findUser", userInfo);
		System.out.println(userInfo.toString());
		return "/user/userSearchResult";
	}
	@RequestMapping("pwsearch")
	String pwresult(Model model,@RequestParam String userid) {
		UserInfo userInfo = userService.search(userid);
		if(userInfo==null) {
			return "/user/userSearch";
		}
		model.addAttribute("findUser", userInfo);
		System.out.println(userInfo.toString());
		return "/user/searchResult";
	}
	@RequestMapping("mvresult")
	String result() {
		return "/user/searchResult";
	}
}
