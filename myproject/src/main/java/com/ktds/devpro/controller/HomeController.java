package com.ktds.devpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

	// 메인 이벤트
	@RequestMapping("/")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption,
			@RequestParam(defaultValue = "0") int pageIdx) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventSt(searchOption, pageIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", pageIdx);
		map.put("searchType", "");
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// 최신일순
	@RequestMapping(path = "/Newest", method = { RequestMethod.GET })
	public ModelAndView new_list(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventSt(searchOption, 0);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchType", "Newest");
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// 마감일순
	@RequestMapping("/Deadline")
	public ModelAndView deadline_list(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventEnd(searchOption, 0);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchType", "Deadline");
		map.put("pageIdx", 0);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// 페이지 이동
	@RequestMapping("/page")
	public ModelAndView page(@RequestParam(defaultValue = "") String searchOption, HttpServletRequest request) throws Exception {
		List<EventVO> list = null;
		int pageIdx = Integer.parseInt(request.getParameter("pageIdx"));
		String searchType = request.getParameter("searchType");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchType.equals("")) {
			list = eventMapper.findEventSt(searchOption, pageIdx);
		}
		else if(searchType.equals("Deadline")) {
			list = eventMapper.findEventEnd(searchOption, pageIdx);
			map.put("searchOption", searchOption);
		}
		else if(searchType.equals("Newest")) {
			list = eventMapper.findEventSt(searchOption, pageIdx);
			map.put("searchOption", searchOption);
		}
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", pageIdx);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
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
