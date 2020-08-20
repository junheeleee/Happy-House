package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.QnA;
import com.ssafy.happyhouse.model.UserInfo;
import com.ssafy.happyhouse.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:8081/happyhouse/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/qna")
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private QnAService qnaService;

    @ApiOperation(value = "모든 질문게시판의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<QnA>> retrieveQnA() throws Exception {
		logger.debug("retrieveQnA - 호출");
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnA(), HttpStatus.OK);
	}

    @ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = QnA.class)    
	@GetMapping("{no}")
	public ResponseEntity<QnA> selectQnAByNo(@PathVariable int no) {
		logger.debug("detailBoard - 호출");
		return new ResponseEntity<QnA>(qnaService.selectQnAByNo(no), HttpStatus.OK);
	}

    @ApiOperation(value = "새로운 QnA를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping("q")
	public ResponseEntity<String> insertQnA(@RequestBody QnA qna) {
		logger.debug("insertQnA - 호출");
		if (qnaService.insertQnA(qna)==1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{no}")
	public ResponseEntity<String> updateQnA(@RequestBody QnA qna) {
		logger.debug("updateQnA - 호출");
		logger.debug("" + qna);
		
		if (qnaService.updateQnA(qna)==1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteQnA(@PathVariable int no) {
		logger.debug("deleteQnA - 호출");
		if (qnaService.deleteQnA(no)==1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
    @ApiOperation(value = "새로운 QnA를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
 	@PostMapping("r")
 	public ResponseEntity<String> insertReply(@RequestBody QnA qna) {
 		logger.debug("insertReply - 호출");
 		if (qnaService.insertReply(qna)==1) {
 			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
 		}
 		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
 	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
 	@PutMapping("r/{no}")
 	public ResponseEntity<String> updateReply(@RequestBody QnA qna) {
 		logger.debug("updateReply - 호출");
 		logger.debug("" + qna);
 		
 		if (qnaService.updateReply(qna)==1) {
 			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
 		}
 		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
 	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
 	@DeleteMapping("r/{no}")
 	public ResponseEntity<String> deleteReply(@PathVariable int no) {
 		logger.debug("deleteReply - 호출");
 		if (qnaService.deleteReply(no)==1) {
 			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
 		}
 		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
 	}
    @ApiOperation(value = "Session userid를 반환", response = String.class)
 	@GetMapping("getUser")
 	public ResponseEntity<String> getUserId(HttpSession session) {
 		logger.debug("get user id - 호출");
 		UserInfo user = (UserInfo) session.getAttribute("userInfo");
 		if (user != null) {
 			return new ResponseEntity<String>(user.getId(), HttpStatus.OK);
 		}
 		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
 	}
}