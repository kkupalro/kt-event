package com.ktds.devpro.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	PasswordEncoder passwordEncoder;
	
	@Resource
	private MemberMapper memberMapper;
	
	@Autowired
	public MemberServiceImpl(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
	
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


	public int registerUser(Member member) {
		int insertBasic = 0;
		int insertDetail = 0;
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		insertBasic = memberMapper.registerBasic(member);
		insertDetail = memberMapper.registerDetail(member);
		if(insertBasic == 1 && insertBasic==insertDetail){
			return 1;
		}else if(insertBasic == 1&& insertDetail == 0) {
			//insertBasic 은 성공, Detail 실패
			memberMapper.deleteUserBasic(member);
		}
		return 0;
	}
	
	public int userIdCheck(String user_id) {
		return memberMapper.userIdCheck(user_id);
	}
	
	
	//login 0522
	public Member loginById(String custId) {
		return memberMapper.securityLoginTEST(custId);
	}
	
	public Member loginByEmail(String custId) {
		return memberMapper.securityLoginByEmail(custId);
	}
	
	public boolean loginMatchPwd(String inputPwd, String getPwd) {
		return passwordEncoder.matches(inputPwd, getPwd);
	}
}
