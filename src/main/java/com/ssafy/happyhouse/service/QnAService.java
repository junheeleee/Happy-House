package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.QnA;


public interface QnAService {
	List<QnA> retrieveQnA();
	QnA selectQnAByNo(int no);
	int insertQnA(QnA qna);
	int updateQnA(QnA qna);
	int deleteQnA(int no);
	int insertReply(QnA qna);
	int updateReply(QnA qna);
	int deleteReply(int no);
	
}
