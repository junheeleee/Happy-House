package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.HouseInfo;
import com.ssafy.happyhouse.model.UserInfo;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.UserService;

@Controller
public class MainController {
	@Autowired
	HouseService houseService;
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/login")
	private String login(HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session, @RequestParam(required = false) String idsave,
			@RequestParam String userid, @RequestParam String password) throws ServletException, IOException {
		System.out.println("===============login=================");
		if (userService.login(userid, password) == 1) {
			UserInfo user = userService.search(userid);
			session.setAttribute("userInfo", user);
			if ("saveok".equals(idsave)) {// 아이디 저장을 체크 했다면.
				Cookie cookie = new Cookie("saveid", userid);
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(60 * 60 * 3);
				response.addCookie(cookie);
			} else {// 아이디 저장을 해제 했다면.
				Cookie cookies[] = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if ("saveid".equals(cookie.getName())) {
							cookie.setMaxAge(0);
							response.addCookie(cookie);
							break;
						}
					}
				}
			}
		}

		return "redirect:/";
	}
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	@RequestMapping("map")
	public String map() {
		return "map/map";
	}
	@RequestMapping("mvmodify")
	public String mvmodify() {
		return "user/userModify";
	}
	@RequestMapping("commerce")
	public String commerce() {	
		return "commerce/list";
	}
	
	@RequestMapping("/mvjoin")
	public String join() {
		return "user/join";
	}
	@RequestMapping("/mvnotice")
	public String mvnotice() {
		return "notice/list";
	}
	@RequestMapping("/mvhot")
	public String mvhot(Model model) throws Exception{
		List<HouseInfo> list = houseService.getTopList();
		model.addAttribute("no1", list.get(0));
		model.addAttribute("no2", list.get(1));
		model.addAttribute("no3", list.get(2));
		model.addAttribute("no4", list.get(3));
		model.addAttribute("no5", list.get(4));
		return "apt/hot";
	}
	@RequestMapping("/mvdetail")
	public String mvdetail() {
		return "apt/detailpage";
	}
	@RequestMapping("/mvpasswordSearch")
	public String passwordSearch() {
		return "user/passwordSearch";
	}
	@RequestMapping("/mvpollution")
	public String pollution(HttpSession session) {
		System.out.println(session.getAttribute("userInfo"));
		return "pollution/list";
	}
	@RequestMapping("/qna")
	public String qna() {
		return "qna/qna";
	}
	@RequestMapping("/register")
	public String regist(UserInfo userInfo, Model model) {
		System.out.println("register");
		System.out.println(userInfo);
		if(userInfo==null)
			return "user/join";
		userService.join(userInfo);
		return "/index";
	}
}
