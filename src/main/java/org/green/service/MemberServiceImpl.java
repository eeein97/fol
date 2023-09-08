package org.green.service;

import java.util.List;

import org.green.domain.AuthVO;
import org.green.domain.MemberVO;
import org.green.mapper.AuthMapper;
import org.green.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_ = {@Autowired})
	private AuthMapper amapper;
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder pwencoder;

	@Override
	public void register(MemberVO mvo, AuthVO avo) {
		//비밀번호 암호화해서 저장
		mvo.setUserpw(pwencoder.encode(mvo.getUserpw()));
		mapper.insert(mvo);
		amapper.insert(avo);
	}

	@Override
	public List<MemberVO> getList(MemberVO mvo) {
		return mapper.getList();
	}

	@Override
	public int idCheck(String userid) {
		return mapper.idCheck(userid);
	}

	@Override
	public void remove(String userid) {
		mapper.delete(userid);
		
	}

	@Override
	public MemberVO getMy(String userid) {
		MemberVO mvo = mapper.myInfo(userid);
		return mvo;
	}

	


}
