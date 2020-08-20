package com.ssafy.happyhouse.dao;

import com.ssafy.happyhouse.model.UserInfo;

public interface UserDAO {
	
	public UserInfo search(String id);
	public int check(String id);
	public int login(String id, String password);
	public int join(UserInfo newUser);
	public int modify(UserInfo modifyInfo);
	public int delete(String id, String password);
}
