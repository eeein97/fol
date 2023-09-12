package org.green.mapper;

import java.util.List;

import org.green.domain.CheckVO;
import org.green.domain.Criteria;

public interface CheckMapper {
	//아이디로 목록 불러오기
	public CheckVO read(Long cno);
	//등록
	public void insert(CheckVO cvo);
	//전체 목록 불러오기
	public List<CheckVO> getList();
	//삭제
	public void delete(String userid);
	//내 예약목록 조회
	public List<CheckVO> myCheckWithPaging(Criteria cri);
	
}
