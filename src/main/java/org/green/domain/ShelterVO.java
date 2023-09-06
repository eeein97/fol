package org.green.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ShelterVO {
	private Long sno;
	private String category;
	private String userid;
	private String gender;
	private String color;
	private String weight;
	private String birth;
	private String stperiod;
	private String endperiod;
	private String content;
	private String center;
	private String department;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private String region;
	private String state;
	private String fileName;
	private String uploadPath;
	private String fullName;
	private boolean fileType;

}
