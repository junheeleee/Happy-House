package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.UserInfo;
import com.ssafy.happyhouse.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(value = "/list")
	private String mvnotice(Model model, @RequestParam(required = false, defaultValue = "") String key, @RequestParam(required = false, defaultValue = "") String word, @RequestParam(required = false, defaultValue = "1") int page) throws ServletException, IOException {
		search(model, key, word, page);
		return "/notice/list";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	private String search(Model model, @RequestParam(required = false, defaultValue = "") String key, @RequestParam(required = false, defaultValue = "") String word, @RequestParam(required = false, defaultValue = "1") int page) throws ServletException, IOException {
		if(key == null || key =="") {
			key = "subject";
			word = "";
		}
		if(page == 0) {
			page = 1;
		}
		Paging paging = new Paging();
		paging.setPage(page);
		paging.setTotalCount(noticeService.getCount(key, word));
		List<NoticeDto> list = noticeService.search(key, word, paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		return "/notice/list";
	}
	@GetMapping("{no}")
	private String detail(@PathVariable int no,Model model, @RequestParam(required = false, defaultValue = "") String key, @RequestParam(required = false, defaultValue = "") String word, @RequestParam(required = false, defaultValue = "1") int page) throws ServletException, IOException {
		System.out.println(no);
		NoticeDto notice = noticeService.content(no);
		model.addAttribute("notice", notice);
//		model.addAttribute("paging", paging);
//		model.addAttribute("key", key);
//		model.addAttribute("word", word);
		return "/notice/content";
	}
	
//	@RequestMapping(value = "/content", method = RequestMethod.GET)
//	private String content(Model model, @RequestParam(required = false) int noticeno) throws ServletException, IOException {
//		NoticeDto noticeDto = noticeService.content(noticeno);
//		model.addAttribute("noticeDto", noticeDto);
//		return "/notice/content";
//	}
	
	@RequestMapping(value = "/mvmodify/{no}", method = RequestMethod.GET)
	private String mvmodify(@PathVariable int no, Model model) throws ServletException, IOException {
		System.out.println(no);
		//System.out.println(noticeno);
		model.addAttribute("notice", noticeService.content(no));
		return "/notice/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	private String modify(@RequestParam Integer noticeno, @RequestParam(required = false) String subject, @RequestParam(required = false) String userid, @RequestParam(required = false) String content, @RequestParam(required = false) String regtime) throws ServletException, IOException {
		System.out.println("here");
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setNoticeno(noticeno);
		noticeDto.setSubject(subject);
		noticeDto.setUserid(userid);
		noticeDto.setContent(content);
		noticeDto.setRegtime(regtime);
		noticeService.modify(noticeDto);
		return "notice/list"; 
	}
	
	@RequestMapping(value = "/delete/{no}")
	private String delete(@PathVariable int no) throws ServletException, IOException {
		noticeService.delete(no);
		return "notice/list"; 
	}
	
	@RequestMapping(value = "/mvwrite", method = RequestMethod.GET)
	private String mvwrite() throws ServletException, IOException{
		return "notice/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	private String write(HttpSession session,@RequestParam String userid, @RequestParam String subject, @RequestParam String content) throws ServletException, IOException {
		System.out.println("write");
		//noticeService.write(userid, subject, content);
		return "/notice/list";
	}
}
