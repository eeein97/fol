package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewService {
	//등록
	public void register(ReviewVO svo);
	//게시글 1개 조회
	public ReviewVO get(Long sno);
	//수정
	public boolean modify(ReviewVO svo);
	//삭제
	public boolean remove(Long sno);
	//목록 조회
	public List<ReviewVO> getList(Criteria cri);
	//게시글 개수 조회
	public int getTotal(Criteria cri);

}

