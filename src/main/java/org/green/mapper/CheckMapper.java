package org.green.mapper;

import java.util.List;

import org.green.domain.CheckVO;
import org.green.domain.Criteria;

public interface CheckMapper {
	//���̵�� ��� �ҷ�����
	public CheckVO read(Long cno);
	//���
	public void insert(CheckVO cvo);
	//��ü ��� �ҷ�����
	public List<CheckVO> getList();
	//����
	public void delete(String userid);
	//�� ������ ��ȸ
	public List<CheckVO> myCheckWithPaging(Criteria cri);
	
}
