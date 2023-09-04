package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;


public interface NoticeMapper {

	@Select("Select * from anotice where nno > 0")
	public List<NoticeVO> getList();

	
	public void insert(NoticeVO nvo);

	
	public NoticeVO read(Long nno);

	
	public int delete(Long nno);

	
	public int update(NoticeVO nvo);

	//페이징 사용해서 조회
	public List<NoticeVO> getListWithPaging(Criteria cri);

	//전체 데이터 개수
	public int getTotalCount(Criteria cri);

	//insert2 메소드에 등록된 번호 받기
	public void insertSelectKey(NoticeVO nvo);

	//검색 연습
	//Map <키: 스트링, 값: map타입>
	public List<NoticeVO> searchTest(Map<String, Map<String,String>> map);
}
