package org.green.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewVO {
	private Long rno;
	private String writer;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private String fileName;
	private String uploadPath;
	private String fullName;
	private boolean fileType;

}
