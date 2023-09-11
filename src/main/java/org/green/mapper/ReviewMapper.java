package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.ReviewVO;

public interface ReviewMapper {
	@Select("Select * from shelter where sno > 0")
	public List<ReviewVO> getList();

	
	public void insert(ReviewVO rvo);

	
	public ReviewVO read(Long rno);

	
	public int delete(Long rno);
	
	//���� ���� ��ȸ
	public List<ReviewVO> myListWithPaging(Criteria cri);
	
	
	public int update(ReviewVO rvo);

	//����¡ ����ؼ� ��ȸ
	public List<ReviewVO> getListWithPaging(Criteria cri);

	//��ü ������ ����
	public int getTotalCount(Criteria cri);

	//insert2 �޼ҵ忡 ��ϵ� ��ȣ �ޱ�
	public void insertSelectKey(ReviewVO rvo);

	//�˻� ����
	//Map <Ű: ��Ʈ��, ��: mapŸ��>
	public List<ReviewVO> searchTest(Map<String, Map<String,String>> map);

}
