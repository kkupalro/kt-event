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
}








