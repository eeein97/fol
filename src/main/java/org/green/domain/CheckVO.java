package org.green.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CheckVO {
	private String cno;
	private String chno;
	private String userId;
	private String userName;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chdate;
	private String chtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
}
