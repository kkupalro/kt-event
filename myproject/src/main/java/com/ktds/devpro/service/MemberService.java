package com.ktds.devpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

//@Service
public interface MemberService {
	public MemberVO findMemberById(String id);
	public List<Member> selectMemberTest();
	
	// login
	public Member findMemberByCustId(String custId);
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
	public UserDetails loginByEmail(String email) throws UsernameNotFoundException;
}
