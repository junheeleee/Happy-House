package com.ssafy.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.UserDAO;
import com.ssafy.happyhouse.model.UserInfo;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO mapper;

	@Override

	public UserInfo search(String id){
		return mapper.search(id);
	}
	public int check(String id){
		
		return mapper.check(id);
	}
	public int login(String id, String password){
		System.out.println("id:"+id+"pw"+password);
		return mapper.login(id,password);
	}
	public int join(UserInfo newUser) {
		return mapper.join(newUser);
	}
	public int modify(UserInfo modifyInfo){
		return mapper.modify(modifyInfo);
	}
	public int delete(String id, String password){
		return mapper.delete(id, password);
	}

}
