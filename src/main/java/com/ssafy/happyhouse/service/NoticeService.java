package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.Paging;


public interface NoticeService {
	public List<NoticeDto> search(String key, String word, Paging paging);
	public NoticeDto content(int noticeno);
	public int modify(NoticeDto noticeDto);
	public int delete(int noticeno);
	public int write(String userid, String subject, String content);
	public int getCount(String key, String word);
}
