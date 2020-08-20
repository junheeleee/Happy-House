package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.QnADAO;
import com.ssafy.happyhouse.model.QnA;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	public QnA selectQnAByNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectQnAByNo(no);
	}

	@Override
	public int insertQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.insertQnA(qna);
	}

	@Override
	public int updateQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateQnA(qna);
	}

	@Override
	public int deleteQnA(int no) {
		// TODO Auto-generated method stub
		return dao.deleteQnA(no);
	}

	@Override
	public int insertReply(QnA qna) {
		// TODO Auto-generated method stub
		return dao.insertReply(qna);
	}

	@Override
	public int updateReply(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateReply(qna);
	}

	@Override
	public int deleteReply(int no) {
		// TODO Auto-generated method stub
		return dao.deleteReply(no);
	}
	
}
