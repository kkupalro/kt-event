package com.ktds.devpro.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

@Mapper
public interface MemberMapper {
	public MemberVO findMemberById(String id);
	public Member selectMemberTest();
}
