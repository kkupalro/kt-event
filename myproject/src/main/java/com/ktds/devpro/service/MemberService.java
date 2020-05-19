package com.ktds.devpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.model.vo.MemberVO;

//@Service
public interface MemberService {
	public MemberVO findMemberById(String id);
	public List<Member> selectMemberTest();
}
