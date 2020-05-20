package com.ktds.devpro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPage(String custId, String custPwd, Model model) {
		String viewName = null;
		Member vo = memberService.findMemberByCustId(custId);
		
		System.out.println(vo);
		
		if(vo == null) {
			// 결과값을 찾지 못했다는 것이므로, 계정이 없다.
			viewName = "login/login_fail";
		}else {
			// 입력한 비밀번호와 계정의 비밀번호가 일치하는지를 확인하여,
			// 결과 페이지를 보여준다.
			if(vo.getPassword().equals(custPwd))
			{
				viewName = "login/login_success";
			}
		}
		
		return viewName;
	}
}
