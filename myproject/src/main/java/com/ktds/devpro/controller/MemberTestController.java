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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "event_login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pwd");

		System.out.println("id " + id + "pwd " + pass);
		UserDetails member = null;
		try {
			if (id.contains("@")) { // email 형식
				member = memberService.loginByEmail(id);
			} else {
				member = memberService.loadUserByUsername(id);
			}

			System.out.println("cont: " + member);
		} catch (UsernameNotFoundException e) {
			return "login/login_fail";
		}

		if (!pass.equals(member.getPassword())) {
			System.out.println("NOT MATCH");
			request.setAttribute("notMatch", true);
			return "event_login";
		}
		session.setAttribute("custId", id);

		return "curr_event";
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

	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail() {
		return "loginFail";
	}

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET)
	 * 
	 * public String home(HttpServletRequest request) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * String id =(String)session.getAttribute("id"); String pw
	 * =(String)session.getAttribute("pw"); //로그인 후 위 방식으로 Session 값 사용 가능 return
	 * "home"; }
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String resisterProcess(HttpServletRequest request) {
		System.out.println(request.getParameter("custId"));

		return "loginFail";
	}

}