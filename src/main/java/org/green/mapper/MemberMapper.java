package org.green.mapper;

import java.util.List;

import org.green.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	//���
	public void insert(MemberVO member);
	//���̵� �ߺ� Ȯ��
	public int idCheck(String userid);
	//ȸ����� �ҷ�����
	public List<MemberVO> getList();
	//����
	public void delete(String userid);
	
}
