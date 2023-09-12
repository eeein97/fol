package org.green.service;

import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewService {
	//���
	public void register(ReviewVO rvo);
	//�Խñ� 1�� ��ȸ
	public ReviewVO get(Long rno);
	//����
	public boolean modify(ReviewVO rvo);
	//����
	public boolean remove(Long rno);
	//��� ��ȸ
	public List<ReviewVO> getList(Criteria cri);
	//�Խñ� ���� ��ȸ
	public int getTotal(Criteria cri);
	//������ �� ��ȸ(����������)
	public List<ReviewVO> myList(Criteria cri);
	//home����
	public List<ReviewVO> homeList(ReviewVO rvo);
}

