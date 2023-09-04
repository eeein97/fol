package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;
import org.green.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper mapper;

	@Override
	public void register(NoticeVO nvo) {
		mapper.insert(nvo);
		System.out.println("nvo : "+nvo.getNno());
		
	}

	@Override
	public NoticeVO get(Long nno) {
		NoticeVO nvo = mapper.read(nno);
		return nvo;
	}

	@Override
	public boolean modify(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return mapper.update(nvo)==1;
	}

	@Override
	public boolean remove(Long nno) {
		// TODO Auto-generated method stub
		return mapper.delete(nno)==1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		List<NoticeVO> noticeList = mapper.getList();
		return noticeList;
	}		
		
}
