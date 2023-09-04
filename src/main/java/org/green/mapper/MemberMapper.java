package org.green.mapper;

import java.util.List;

import org.green.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	//등록
	public void insert(MemberVO member);
	//아이디 중복 확인
	public int idCheck(String userid);
	//회원목록 불러오기
	public List<MemberVO> getList();
	//삭제
	public void delete(String userid);
	
}
