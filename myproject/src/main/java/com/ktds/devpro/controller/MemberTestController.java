package com.ktds.devpro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
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
		return "login/loginPage";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request) {
		String id = request.getParameter("custId");
		String pass = request.getParameter("custPwd");
		
		return "login/loginPage";
	}

	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {

        //CustomAuthenticationProvider에서 set한 값을 로드
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getDetails();
		/*
		 * //세션 설정 session.setAttribute("id", user.getId()); session.setAttribute("pw",
		 * user.getPw());
		 */
		return "loginSuccess";

	}
	

	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail() {
		return "loginFail";
	}

	
/*
	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String home(HttpServletRequest request) {

	    HttpSession session = request.getSession();

	    String id =(String)session.getAttribute("id");
	    String pw =(String)session.getAttribute("pw");
	    //로그인 후 위 방식으로 Session 값 사용 가능
		return "home";
	}
*/
	

}