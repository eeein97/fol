package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ShelterVO;

public interface ShelterService {
	//���
	public void register(ShelterVO svo);
	//�Խñ� 1�� ��ȸ
	public ShelterVO get(Long sno);
	//����
	public boolean modify(ShelterVO svo);
	//����
	public boolean remove(Long sno);
	//��� ��ȸ
	public List<ShelterVO> getList(Criteria cri);
	//�Խñ� ���� ��ȸ
	public int getTotal(Criteria cri);
	
	public List<ShelterVO> myShelList(Criteria cri);

}

