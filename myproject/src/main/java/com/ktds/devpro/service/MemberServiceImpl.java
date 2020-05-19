package com.ktds.devpro.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberMapper memberMapper;

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public List<Member> selectMemberTest() {
		return memberMapper.selectMemberTest();
	}
}
