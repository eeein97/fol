package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewService {
	//���
	public void register(ReviewVO svo);
	//�Խñ� 1�� ��ȸ
	public ReviewVO get(Long sno);
	//����
	public boolean modify(ReviewVO svo);
	//����
	public boolean remove(Long sno);
	//��� ��ȸ
	public List<ReviewVO> getList(Criteria cri);
	//�Խñ� ���� ��ȸ
	public int getTotal(Criteria cri);

}

