package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewService {
	//등록
	public void register(ReviewVO rvo);
	//게시글 1개 조회
	public ReviewVO get(Long rno);
	//수정
	public boolean modify(ReviewVO rvo);
	//삭제
	public boolean remove(Long rno);
	//목록 조회
	public List<ReviewVO> getList(Criteria cri);
	//게시글 개수 조회
	public int getTotal(Criteria cri);
	//내가쓴 글 조회(마이페이지)
	public List<ReviewVO> myList(Criteria cri);
	//home리뷰
	public List<ReviewVO> homeList(ReviewVO rvo);
}

