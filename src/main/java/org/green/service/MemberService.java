package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.MemberVO;

public interface MemberService {
	//등록
	public void register(MemberVO mvo, AuthVO avo);
	//목록
	public List<MemberVO> getList(MemberVO mvo);
	//아이디 중복 검사
	public int idCheck(String userid);
	//탈퇴
	public void remove(String userid);
	//내정보
	public MemberVO getMy(String userid);
	
}
