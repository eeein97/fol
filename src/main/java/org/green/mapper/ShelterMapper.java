package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.ShelterVO;

public interface ShelterMapper {

	@Select("Select * from shelter where sno > 0")
	public List<ShelterVO> getList();

	
	public void insert(ShelterVO svo);

	
	public ShelterVO read(Long sno);

	
	public int delete(Long sno);

	
	public int update(ShelterVO svo);

	//예약목록 보기
	public List<ShelterVO> myChListWithPaging(Criteria cri);

	//페이징 사용해서 조회
	public List<ShelterVO> getListWithPaging(Criteria cri);

	//전체 데이터 개수
	public int getTotalCount(Criteria cri);

	//insert2 메소드에 등록된 번호 받기
	public void insertSelectKey(ShelterVO svo);

	//검색 연습
	//Map <키: 스트링, 값: map타입>
	public List<ShelterVO> searchTest(Map<String, Map<String,String>> map);
}
