package com.ktds.devpro.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService, UserDetailsService {

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

	@Override
	public Member findMemberByCustId(String custId) {
		return memberMapper.findMemberByCustId(custId);
	}

	//YE: 0520 13:20 Secure Login 추가
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberMapper.securityLogin(username);
		System.out.println(member);
		 if(null == member) {
	            throw new UsernameNotFoundException("User Not Found");
	     }

		///member.setPassword("{noop}1596");		//test password -> 실제로 사용할 땐 지워줘야함
		//System.out.println(member + "//\n");
		return member;
	}
}
