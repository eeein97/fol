package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;


public interface NoticeMapper {

	@Select("Select * from anotice where nno > 0")
	public List<NoticeVO> getList();

	
	public void insert(NoticeVO nvo);

	
	public NoticeVO read(Long nno);

	
	public int delete(Long nno);

	
	public int update(NoticeVO nvo);

	//����¡ ����ؼ� ��ȸ
	public List<NoticeVO> getListWithPaging(Criteria cri);

	//��ü ������ ����
	public int getTotalCount(Criteria cri);

	//insert2 �޼ҵ忡 ��ϵ� ��ȣ �ޱ�
	public void insertSelectKey(NoticeVO nvo);

	//�˻� ����
	//Map <Ű: ��Ʈ��, ��: mapŸ��>
	public List<NoticeVO> searchTest(Map<String, Map<String,String>> map);
}
