package com.team3web.shop.service;

import javax.servlet.http.HttpSession;

import com.team3web.shop.vo.UserVO;

public interface LoginService {
	
	public int loginCheck(UserVO user, HttpSession session);
	
	public UserVO viewUser(UserVO user);
	
	public void logout(HttpSession session);
	
	public String idFind(UserVO user);
	
	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
	
	public String getPasswordById(String id);
	
	public UserVO getUserById(String id);
	
	public int getUserRole(String id);
	
	public String getUserName(String id);
	public void updateUser(UserVO user); // 사용자 업데이트
	public void insertUser(UserVO user); // 사용자 삽입

	

	public boolean changePassword(String userId, String oldPassword, String newPassword);
}
