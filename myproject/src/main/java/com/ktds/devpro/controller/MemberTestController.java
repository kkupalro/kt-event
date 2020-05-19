package com.ktds.devpro.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;

@Controller
public class MemberTestController {

	@Resource
	private MemberMapper memberMapper;

	@RequestMapping("member")
	public String findMemberById(String memberId, Model model) {
		List<Member> vo = memberMapper.selectMemberTest();
		model.addAttribute("member", vo);
		return "test";
	}	// git push origin 200519
	
	@RequestMapping("login")
	public String loginPage() {
		return null;
	}
}
