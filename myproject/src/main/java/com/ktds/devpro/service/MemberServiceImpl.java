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
public class MemberServiceImpl implements MemberService, UserDetailsService {
	
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
	
	@Override
	public UserDetails loginByEmail(String email) throws UsernameNotFoundException{
		Member member = memberMapper.securityLoginByEmail(email);
		System.out.println(member);
		if(null == member) {
            throw new UsernameNotFoundException("User Not Found");
		}
		
		return member;
	}
	public int registerUser(Member member) {
		int insertBasic = 0;
		int insertDetail = 0;
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		insertBasic = memberMapper.registerBasic(member);
		System.out.println(member.getCustIdx());
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
	
	
	//login new!
	public boolean loginById(String custId, String inputPwd) {
		System.out.println(custId + " " +  inputPwd);
		Member member = memberMapper.securityLoginTEST(custId);
		System.out.println(member);
		System.out.println(passwordEncoder.matches(inputPwd, member.getPassword()));
		return true;
	}
	
}
