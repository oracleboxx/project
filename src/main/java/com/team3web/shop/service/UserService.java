package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.vo.UserVO;

public interface UserService {
	public void insertUser(UserVO user); // 사용자 삽입
	
	public void updateUser(UserVO user); // 사용자 업데이트
	
	public void deleteUser(String userId); // 사용자 삭제
	
	public UserVO getUserById(String userId); // 아이디로 사용자 조회
	
	public List<UserVO> getAllUsers(); // 모든 사용자 조회
	
	int getUserRole(int verify); // 등급 조회
}