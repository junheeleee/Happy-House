package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.NoticeDAO;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.Paging;

import java.lang.Exception;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;

//	@Override
//	public List<NoticeDto> selectAll(){
//		return dao.selectAll();
//	}
	
	@Override
	public List<NoticeDto> search(String key, String word, Paging paging){
		return dao.search(key, word, paging);
	}
	
	@Override
	public NoticeDto content(int noticeno){
		return dao.content(noticeno);
	}
	
	@Override
	public int modify(NoticeDto noticeDto) {
		return dao.modify(noticeDto);
	}
	
	@Override
	public int delete(int noticeno) {
		return dao.delete(noticeno);
	}
	
	@Override
	public int write(String userid, String subject, String content) {
		return dao.write(userid, subject, content);
	}
	
	@Override
	public int getCount(String key, String word) {
		return dao.getCount(key, word);
	}
	
	
	
	
	
	
	
	
//	@Override
//	public void writeNotice(NoticeDto noticeDto) throws Exception {
//		if(noticeDto.getSubject() == null || noticeDto.getContent() == null) {
//			throw new Error();
//		}
//		noticeDao.writeNotice(noticeDto);
//	}
//
//	@Override
//	public List<NoticeDto> listNotice(String key, String word) throws Exception {
//		key = key == null ? "" : key;
//		word = word == null ? "" : word;
//		System.out.println(noticeDao.listNotice(key, word));
//		return noticeDao.listNotice(key, word);
//	}
//
//	@Override
//	public NoticeDto getNotice(int noticeno) throws Exception {
//		return noticeDao.getNotice(noticeno);
//	}
//
//	@Override
//	public void modifyNotice(NoticeDto noticeDto) throws Exception {
//		noticeDao.modifyNotice(noticeDto);
//	}
//
//	@Override
//	public void deleteNotice(int noticeno) throws Exception {
//		noticeDao.deleteNotice(noticeno);
//	}

}
