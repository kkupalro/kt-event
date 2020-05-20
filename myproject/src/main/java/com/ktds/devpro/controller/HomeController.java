package com.ktds.devpro.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.mapper.MemberMapper;
@Controller
public class HomeController {
	@Resource
	private MemberMapper memberMapper;
	
	@RequestMapping("/")
	public String home(Model model) {
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
	
	
}








