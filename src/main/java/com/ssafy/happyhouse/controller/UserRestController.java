package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.UserInfo;
import com.ssafy.happyhouse.service.UserService;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/user.do")
public class UserRestController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login")
	private ResponseEntity<HashMap<String, Integer>> login(HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session, @RequestParam(required = false) String idsave,
			@RequestParam String userid, @RequestParam String password) throws ServletException, IOException {
		HashMap<String, Integer> obj = new HashMap<>();
		System.out.println("===============login=================");
		if (userService.login(userid, password) == 1) {
			UserInfo user = userService.search(userid);
			session.setAttribute("userInfo", user);
			obj.put("res", 1);
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
		} else {
			obj.put("res", 0);
		}

		return new ResponseEntity<HashMap<String, Integer>>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/logout")
	private ResponseEntity<HashMap<String, Integer>> logout(HttpSession session) throws ServletException, IOException {
		HashMap<String, Integer> obj = new HashMap<String, Integer>();
		session.invalidate();
		obj.put("res", 1);
		return new ResponseEntity<HashMap<String, Integer>>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	private ResponseEntity<HashMap<String, Integer>> checkid(@RequestParam String userid)
			throws ServletException, IOException {
		HashMap<String, Integer> map = new HashMap<>();
		try {
			int userCnt = userService.check(userid);
			if (userCnt == 1) {
				map.put("res", 1);
			} else {
				map.put("res", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", -1);
		}
		return new ResponseEntity<HashMap<String, Integer>>(map, HttpStatus.OK);
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	private ResponseEntity<HashMap<String, Integer>> register(UserInfo user, Model model)
			throws ServletException, IOException {
		HashMap<String, Integer> map = new HashMap<>();
		System.out.println(user);
		try {
			userService.join(user);
			map.put("res", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", -1);
		}
		return new ResponseEntity<HashMap<String, Integer>>(map, HttpStatus.OK);
	}
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	private ResponseEntity<HashMap<String, Integer>> modify(UserInfo user, Model model,HttpSession session)
//			throws ServletException, IOException {
//		HashMap<String, Integer> map = new HashMap<>();
//		try {
//			userService.modify(user);
//			map.put("res", 1);
//		} catch (Exception e) {
//			e.printStackTrace();
//			map.put("res", -1);
//		}
//		return new ResponseEntity<HashMap<String, Integer>>(map, HttpStatus.OK);
//	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	private ResponseEntity<HashMap<String, Integer>> delete(HttpSession session, @RequestParam String userid, @RequestParam String password)
			throws ServletException, IOException {
		HashMap<String, Integer> map = new HashMap<>();
		try {
			if(userService.delete(userid,password)==1) {
				session.invalidate();
				map.put("res", 1);
			}
			else
				map.put("res", 0);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", -1);
		}
		return new ResponseEntity<HashMap<String, Integer>>(map, HttpStatus.OK);
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	private ResponseEntity<HashMap<String, Integer>> modify(HttpSession session, UserInfo user, Model model)
			throws ServletException, IOException {
		HashMap<String, Integer> map = new HashMap<>();
		try {
			if(userService.modify(user)==1) {
				session.setAttribute("userInfo", user);
				map.put("res", 1);
			}
			else
				map.put("res", 0);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", -1);
		}
		return new ResponseEntity<HashMap<String, Integer>>(map, HttpStatus.OK);
	}
	String del(Model model, UserInfo userInfo, HttpSession session) {
		userService.delete(userInfo.getId(), userInfo.getPassword());
		System.out.println("del");
		session.invalidate();
		return "redirect:/";
	}


	
	

}
