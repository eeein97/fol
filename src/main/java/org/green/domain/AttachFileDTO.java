package org.green.domain;

import lombok.Data;

@Data
//���������̸�, uuid��, �̹��� ���������� �ϳ��� ��� �����ϴ� �뵵
public class AttachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
