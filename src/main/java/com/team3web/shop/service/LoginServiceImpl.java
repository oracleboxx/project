package com.team3web.shop.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	LoginDAO LoginDAO;
	
	private final PasswordEncoder passwordEncoder;

    @Autowired
    public LoginServiceImpl(LoginDAO LoginDAO, PasswordEncoder passwordEncoder) {
        this.LoginDAO = LoginDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
	public int loginCheck(UserVO user, HttpSession session) {
		UserVO dbUser = LoginDAO.getUserById(user.getId());

        if (dbUser != null) {
            if (passwordEncoder.matches(user.getPassword(), dbUser.getPassword())) {
                return 1;
            }
        }
        return 0;
    }
    @Override
    public boolean changePassword(String userId, String oldPassword, String newPassword) {
    	UserVO dbUser = LoginDAO.getUserById(userId);
    	if(dbUser!=null) {
    		if(passwordEncoder.matches(oldPassword, dbUser.getPassword())) {
    			String encodedNewPassword = passwordEncoder.encode(newPassword);
    		dbUser.setPassword(encodedNewPassword);
    		LoginDAO.updateUser(dbUser);
    		return true;
    		}
    	}
    	return false;
    	
    }

	@Override
	public UserVO viewUser(UserVO user) {
		return LoginDAO.viewUser(user);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public String idFind(UserVO user) {
		String result = LoginDAO.idFind(user);
		return result;
	}

	@Override
	public String pwFind(UserVO user) {
		String result = LoginDAO.pwFind(user);
		return result;
	}

	@Override
	public void updatePw(UserVO user) {
		LoginDAO.updatePw(user);
	}

	@Override
	public String getPasswordById(String id) {
		return null;
	}

	@Override
	public UserVO getUserById(String id) {
		return LoginDAO.getUserById(id);
	}

	@Override
	public int getUserRole(String id) {
	    int userRole = LoginDAO.getUserRole(id);
	    return userRole;
	}
	
	@Override
    public String getUserName(String id) {
        return LoginDAO.getUserName(id);
    }

	@Override
	public void updateUser(UserVO user) {
		LoginDAO.updateUser(user);
	}

	@Override
	public void insertUser(UserVO user) {
		LoginDAO.insertUser(user);
	}
}