package org.green.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	//������
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))* 10;
		this.startPage = this.endPage - 9;
		//��ü ������ ������ ��ȣ
		int realEnd = (int) (Math.ceil((total*1.0)/cri.getAmount()));
		//������ ������ ���� ����¡��������ȣ�� ũ�� ����¡ ������ ��ȣ�� ���� ������ ��ȣ�� �Ҵ�
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		//���������� ��ȣ�� 1���� ũ�� prev�� true
		this.prev = this.startPage > 1;
		//������������ ��ȣ�� ���� ������ ������ ��ȣ���� ������ next true
		this.next = this.endPage < realEnd;
	}
	
}
