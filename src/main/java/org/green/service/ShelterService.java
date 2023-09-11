package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ShelterVO;

public interface ShelterService {
	//등록
	public void register(ShelterVO svo);
	//게시글 1개 조회
	public ShelterVO get(Long sno);
	//수정
	public boolean modify(ShelterVO svo);
	//삭제
	public boolean remove(Long sno);
	//목록 조회
	public List<ShelterVO> getList(Criteria cri);
	//게시글 개수 조회
	public int getTotal(Criteria cri);
	
	public List<ShelterVO> myShelList(Criteria cri);

}

