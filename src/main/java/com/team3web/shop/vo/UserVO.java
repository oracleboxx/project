package com.team3web.shop.vo;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	@NotNull
	@Pattern(regexp = "[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}",
			message = "이메일이 올바른 형식이 아닙니다.")
	private String id;
	
	@NotNull
	@Pattern(regexp = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W).{8,20}",
			message = "비밀번호는 특수문자, 숫자, 영문 대소문자를 혼합하여 8~20로 입력해야 합니다.")
//	@Pattern(regexp = "(?=.*\\d).{6, 20}",
//			message = "비밀번호는 숫자를 포함한 6~20자를 입력해야합니다.")
	private String password;
	
	@NotNull
	@Size(min = 2, max = 50, message = "이름은 2자 이상 입니다.")
	private String name;
	
	@NotNull(message="필수 사항은 반드시 입력하세요")
	private String gender;
	
	@NotNull(message="닉네임을 작성해주세요")
	private String nickname;
	
	@NotNull
	@Pattern(regexp = "\\d{3}\\d{3,4}\\d{4}", message="연락처가 올바르지 않습니다.")
	private String phone;
	
	@NotNull
	@Size(max=5, message="우편번호가 올바르지 않습니다.")
	private String zipcode;
	
	@NotNull
	@Size(min=10, max=300, message="기본주소를 입력하세요.")
	private String roadAddr1;
	
	@NotNull
	@Size(min=2, max=100, message="상세 주소를 입력하세요.")
	private String roadAddr2;
	
	private String address; // 기본주소 + 상세주소
	
	@Past(message="생일은 금일 기준 이전 일이 들어가야 합니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@NotNull
	private Date birthday;

	private String joindate;
	private String updatedate;
	private int verify;
	
	public UserVO() {}

	public UserVO(UserVO user) {
		this.id = user.getId();
		this.password = user.getPassword();
		this.name = user.getName();
		this.gender = user.getGender();
		this.nickname = user.getNickname();
		this.phone = user.getPhone();
		this.zipcode = user.getZipcode();
		this.roadAddr1 = user.getRoadAddr1();
		this.roadAddr2 = user.getRoadAddr2();
		this.address = user.getRoadAddr1()+"*"+user.getRoadAddr2();
		this.birthday = user.getBirthday();
		this.joindate = user.getJoindate();
		this.updatedate = user.getUpdatedate();
		this.verify = user.getVerify();
	}
	
	// map 형식 생성자
	public UserVO(Map<String, String[]> map) {
		
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		
		while(it.hasNext()) {
			
			String fldName = it.next();
			
			if(fldName.equals("submit_btn")) {
				this.id = map.get("id")[0];
				this.password = map.get("password")[0];
				this.name = map.get("name")[0];
				this.gender = map.get("gender")[0];
				this.nickname = map.get("nickname")[0];
				this.phone = map.get("phone")[0];
				// 우편번호
				this.zipcode = map.get("zipcode")[0];
				this.roadAddr1 = map.get("roadAddr1")[0]; // 기본 주소
				this.roadAddr2 = map.get("roadAddr2")[0]; // 상세 주소
				// 도로명 주소 조건부 병합 : ex) 기본주소+"*"+상세주소
				StringBuilder address = new StringBuilder();
				address.append(map.get("roadAddr1")[0])
				        .append("*")
				        .append(map.get("roadAddr2")[0]);
				this.address = address.toString();
				this.birthday = java.sql.Date.valueOf(map.get("birthday")[0]);
				this.joindate = map.get("joindate")[0];
			}
		}
	}
}