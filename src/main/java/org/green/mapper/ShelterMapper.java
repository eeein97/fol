package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.green.domain.Criteria;
import org.green.domain.ShelterVO;

public interface ShelterMapper {

	@Select("Select * from shelter where sno > 0")
	public List<ShelterVO> getList();

	
	public void insert(ShelterVO svo);

	
	public ShelterVO read(Long sno);

	
	public int delete(Long sno);

	
	public int update(ShelterVO svo);

	//������ ����
	public List<ShelterVO> myChListWithPaging(Criteria cri);

	//����¡ ����ؼ� ��ȸ
	public List<ShelterVO> getListWithPaging(Criteria cri);

	//��ü ������ ����
	public int getTotalCount(Criteria cri);

	//insert2 �޼ҵ忡 ��ϵ� ��ȣ �ޱ�
	public void insertSelectKey(ShelterVO svo);

	//�˻� ����
	//Map <Ű: ��Ʈ��, ��: mapŸ��>
	public List<ShelterVO> searchTest(Map<String, Map<String,String>> map);
}
