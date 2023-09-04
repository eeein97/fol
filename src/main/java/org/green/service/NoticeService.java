package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;

public interface NoticeService {
	//���
	public void register(NoticeVO nvo);
	//�Խñ� 1�� ��ȸ
	public NoticeVO get(Long nno);
	//����
	public boolean modify(NoticeVO nvo);
	//����
	public boolean remove(Long nno);
	//��� ��ȸ
	public List<NoticeVO> getList(Criteria cri);
	//�Խñ� ���� ��ȸ
	public int getTotal(Criteria cri);
}
