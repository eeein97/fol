package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewMapper {
	@Select("Select * from shelter where sno > 0")
	public List<ReviewVO> getList();

	
	public void insert(ReviewVO rvo);

	
	public ReviewVO read(Long rno);

	
	public int delete(Long rno);
	
	//내가 쓴글 조회
	public List<ReviewVO> myListWithPaging(Criteria cri);
	
	
	public int update(ReviewVO rvo);

	//페이징 사용해서 조회
	public List<ReviewVO> getListWithPaging(Criteria cri);

	//전체 데이터 개수
	public int getTotalCount(Criteria cri);

	//insert2 메소드에 등록된 번호 받기
	public void insertSelectKey(ReviewVO rvo);

	//검색 연습
	//Map <키: 스트링, 값: map타입>
	public List<ReviewVO> searchTest(Map<String, Map<String,String>> map);

}
