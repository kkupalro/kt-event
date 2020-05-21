package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

@Mapper
public interface MemberMapper {
	public MemberVO findMemberById(String id);
	public List<Member> selectMemberTest();
	public Member findMemberByCustId(String custId);
	
	public Member securityLogin(String id);
	public Member securityLoginByEmail(String email);
}
