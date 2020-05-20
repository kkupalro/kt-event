package com.ktds.devpro.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.MemberVO;


@Controller
public class MemberController {
	@Resource
	private MemberMapper memberMapper;

	@RequestMapping("find-member-by-id")
	public String findMemberById(String memberId, Model model) {
		String viewName = null;
		MemberVO vo = memberMapper.findMemberById(memberId);
		if (vo == null)
			viewName = "member/find_fail";
		else {
			viewName = "member/find_success";
			model.addAttribute("memberVO", vo);
		}
		return viewName;
	}
}
