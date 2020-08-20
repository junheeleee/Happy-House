package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.Paging;

public interface NoticeDAO {
	public List<NoticeDto> search(String key, String word, Paging paging);
	public NoticeDto content(int num);
	public int modify(NoticeDto noticeDto);
	public int delete(int no);
	public int write(String userid, String subject, String content);
	public int getCount(String key, String word);
}
