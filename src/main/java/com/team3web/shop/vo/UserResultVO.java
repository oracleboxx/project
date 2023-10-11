package com.team3web.shop.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserResultVO {
	
    private String id;
	private String password;
    private String name;
    private String gender;
    private String phone;
    private String email;
    private String nickname;
    private String zipcode;
    private String address;
    private String address2;
    private String birthday;
    private Date joinDate;
    private Date updateDate;
    private int verify;

   
}