package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.MemberVO;

public interface MemberService {
	//���
	public void register(MemberVO mvo, AuthVO avo);
	//���
	public List<MemberVO> getList(MemberVO mvo);
	//���̵� �ߺ� �˻�
	public int idCheck(String userid);
	//Ż��
	public void remove(String userid);
	//������
	public MemberVO getMy(String userid);
	
}
