package org.green.service;

import java.util.List;

import org.green.domain.Criteria;
import org.green.domain.ShelterVO;
import org.green.mapper.ShelterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShelterServiceImpl implements ShelterService{
	@Setter(onMethod_= {@Autowired})
	private ShelterMapper mapper;		
	
		@Override
		public void register(ShelterVO svo) {
			mapper.insert(svo);
			System.out.println("sno : "+svo.getSno());
		}

		@Override
		public ShelterVO get(Long sno) {
			ShelterVO svo = mapper.read(sno);
			return svo;
		}

		@Override
		public boolean modify(ShelterVO svo) {
			// TODO Auto-generated method stub
			return mapper.update(svo)==1;
		}

		@Override
		public boolean remove(Long sno) {
			// TODO Auto-generated method stub
			return mapper.delete(sno)==1;
		}

		@Override
		public List<ShelterVO> getList(Criteria cri) {
			List<ShelterVO> shelterList = mapper.getList();
			return shelterList;
		}

		@Override
		public int getTotal(Criteria cri) {
			return mapper.getTotalCount(cri);
		}

		@Override
		public List<ShelterVO> myShelList(Criteria cri) {
			// TODO Auto-generated method stub
			return mapper.myChListWithPaging(cri);
		}

	}