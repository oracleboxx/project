package com.team3web.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team3web.shop.vo.UserVO;

@Mapper
public interface UserDAO {
	void insertUser(UserVO user); // 사용자 삽입
	
    void updateUser(UserVO user); // 사용자 업데이트
    
    void deleteUser(String userId); // 사용자 삭제
    
    UserVO getUserById(String userId); // 아이디로 사용자 조회
    
    List<UserVO> getAllUsers(); // 모든 사용자 조회
    
    int getUserRole(int verify); // 등급 조회
}