package com.ktds.devpro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.devpro.model.vo.Member;
import com.ktds.devpro.service.MemberService;

@Controller
public class MemberTestController {

	@Autowired
	private MemberService memberService;

	



	

	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail() {
		return "loginFail";
	}


	
	
	
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {
		System.out.println(memberService.userIdCheck(user_id));
		return memberService.userIdCheck(user_id);
	}
	
	@RequestMapping(value = "/TESTlogin", method = RequestMethod.GET)
	public String TESTLOGIN(HttpServletRequest request, String id, String pw){
		return "redirect:/";
	}

	
	
	
	
	//YE| 0522 로그인 관련 페이지 정리
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("custId") != null)	return "redirect:/";
		return "event_login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pwd");
		Member member = null;
		System.out.println("id " + id + "pwd " + pass);
		if (id.contains("@")) { // email 형식
			member = memberService.loginByEmail(id);
		} else {
			member = memberService.loginById(id);
		}

		
		if(member == null){
			System.out.println("ID IS NOT FOUND");
			request.setAttribute("ERROR", "사용자 정보가 없습니다.");
			return "event_login";
		}else {
			if(memberService.loginMatchPwd(pass, member.getPassword())) {
				session.setAttribute("custId", id);
			}else {
				System.out.println("NOT MATCH");
				request.setAttribute("ERROR", "비밀번호가 틀립니다.");
				return "event_login";
			}
		}


		return "redirect:/";
	}
	

	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {

		// CustomAuthenticationProvider에서 set한 값을 로드
		// User user =
		// (User)SecurityContextHolder.getContext().getAuthentication().getDetails();
		/*
		 * //세션 설정 session.setAttribute("id", user.getId()); session.setAttribute("pw",
		 * user.getPw());
		 */
		return "curr_event";

	}
	
	
	
	
	//YE| 0522 회원가입 관련 페이지 정리
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(HttpSession session) {
		if(session.getAttribute("custId") != null)	return "redirect:/";
		return "event_register";
	}
	
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public String resisterProcess(HttpServletRequest request) {
		System.out.println(request.getParameter("custId"));
		Member member = new Member();
		
		member.setId(request.getParameter("custId"));
		member.setPassword(request.getParameter("custPwd"));
		member.setEmail(request.getParameter("custEmail"));
		member.setPhone(request.getParameter("custPhone"));
		member.setName(request.getParameter("custName"));
		
		if(memberService.registerUser(member) == 1) {
			//환영 멘트
			request.setAttribute("custName", member.getName());
			return "/event_register_Success";
		}
		return "/event_register";
	}
	
	
	
	
	
	
	
	
	
}