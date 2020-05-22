package com.ktds.devpro.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;




@Controller
public class HomeController {
	@Resource
	private MemberMapper memberMapper;
	
	@Resource
	private EventMapper eventMapper;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<EventVO> vo = eventMapper.findEventCur();
		model.addAttribute("evt", vo);
		return "curr_event";
	}
	

	@RequestMapping("/event_detail")
	public String detail(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		List<EventVO> vo = eventMapper.findEventByIdx(id);
		List<EventDtVO> dt_vo = eventMapper.searchEventDtList(id);
		model.addAttribute("evt_dt", dt_vo);
		model.addAttribute("evt", vo);
		return "event_detail";
	}
	
	
	
	
	
}








