package org.green.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String phone;
	private String email;
	private String address;
	private boolean enabled;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	//여러개 사용자 권한
	private List<AuthVO> authList;	
	
}
