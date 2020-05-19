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
		@RequestMapping("select-member-test")
		public String findMemberById(String memberId,Model model) {
			List<Member> vo=memberMapper.selectMemberTest();
			System.out.println(vo.get(0));
			model.addAttribute("member", vo);
			return "test";
		}	

}
