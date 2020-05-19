package com.ktds.devpro.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.service.MemberService;

@Controller
public class MemberTestController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("member")
	public String findMemberById(String memberId, Model model) {
		List<Member> vo = memberService.selectMemberTest();
		model.addAttribute("member", vo);
		return "test";
	}
	
	@RequestMapping("login")
	public String loginPage() {
		return null;
	}
}
