package com.ktds.devpro.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class HomeController {
	@Resource
	private EventMapper eventMapper;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<EventVO> vo = eventMapper.findEventAll();
		model.addAttribute("evt", vo);
		return "curr_event";
	}
	
	
	@RequestMapping("/event_detail")
	public String detail(Model model) {
		return "event_detail";
	}
	@RequestMapping("/event")
	public String event(Model model) {
		return "frst_event";
	}
	
	@RequestMapping("/lte")
	public String scnd(Model model) {
		return "scnd_event";
	}
	
	@RequestMapping("/check")
	public String thrd(Model model) {
		return "thrd_event";
	}
	
	@RequestMapping("/last")
	public String frth(Model model) {
		return "frth_event";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "event_login";
	}
	@RequestMapping("/register")
	public String register(Model model) {
		return "event_register";
	}
	
	
}








