package org.green.domain;

import lombok.Data;

@Data
public class NoticeVO {
	private String nno;
	private String category;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	private String fileName;
	private String uploadPath;
	private String fullName;
	
}
