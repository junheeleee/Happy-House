package com.ssafy.happyhouse.service;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.UserInfo;


public interface UserService {

	public UserInfo search(String id);
	public int check(String id);
	public int login(String id, String password);
	//public UserInfo passwordFind(String id) throws SQLException;
	public int join(UserInfo newUser);
	
	//public boolean find(String id,String password) throws SQLException;
	public int modify(UserInfo modifyInfo);
	public int delete(String id, String password);
	


}
