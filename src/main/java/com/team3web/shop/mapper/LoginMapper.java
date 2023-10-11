package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserVO;

public interface LoginMapper {
	
	public int loginCheck(UserVO user);
	
	public UserVO viewUser(UserVO user);
	
	public String idFind(UserVO user);

	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
	
	public String getPasswordById(String id);

	public UserVO getUserById(String id);
	
	public int getUserRole(String id);
	
	public String getUserName(String id);
	
    public void updateUser(UserVO user);

	public void insertUser(UserVO user);
}
