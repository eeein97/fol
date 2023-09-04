package org.green.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	
	//�����ڸ� ���ؼ� �⺻�� 1������, 10���� ����
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	//�˻������� �迭�� ���� ����(�ѹ��� ó���ϱ� ����)
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
