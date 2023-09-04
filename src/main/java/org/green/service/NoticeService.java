package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;

public interface NoticeService {
	//등록
	public void register(NoticeVO nvo);
	//게시글 1개 조회
	public NoticeVO get(Long nno);
	//수정
	public boolean modify(NoticeVO nvo);
	//삭제
	public boolean remove(Long nno);
	//목록 조회
	public List<NoticeVO> getList(Criteria cri);
	//게시글 개수 조회
	public int getTotal(Criteria cri);
}
