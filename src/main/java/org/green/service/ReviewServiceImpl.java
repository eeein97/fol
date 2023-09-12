package org.green.service;

import java.util.List;

import org.green.domain.Criteria;
import org.green.domain.ReviewVO;
import org.green.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_= {@Autowired})
	private ReviewMapper mapper;		
	
	@Override
	public void register(ReviewVO rvo) {
		mapper.insert(rvo);
		System.out.println("sno : "+rvo.getRno());
	}

	@Override
	public ReviewVO get(Long rno) {
		ReviewVO rvo = mapper.read(rno);
		return rvo;
	}

	@Override
	public boolean modify(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return mapper.update(rvo)==1;
	}

	@Override
	public boolean remove(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno)==1;
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		List<ReviewVO> reviewList = mapper.getListWithPaging(cri);
		return reviewList;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	//내가 쓴글 목록
	@Override
	public List<ReviewVO> myList(Criteria cri) {
		return mapper.myListWithPaging(cri);
	}

	@Override
	public List<ReviewVO> homeList(ReviewVO rvo) {
		return mapper.homeReview(rvo);
	}

}
