package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserVO;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
	
	void insertUser(UserVO user);
	
    void updateUser(UserVO user);
    
    void deleteUser(String id);
    
    UserVO selectById(String id);
    
    String selectCountById(String id);
    
    List<UserVO> selectByName(String name);
    
    void updateEnabled(HashMap<String, Object> map);
    
    void updatePassword(HashMap<String, Object> map);
    
    UserVO getUserByNickname(String nickname);
    
    int getUserRole(int verify);
    
    UserVO getUserById(String id);

}