package com.ktds.devpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class HomeController {
	@Autowired
	private EventSearchService eventSrcService;
	
	@Resource
	private MemberMapper memberMapper;

	@Resource
	private EventMapper eventMapper;
	
	//taejun : 0525 17:30 메인 이벤트(홈) 추가
	@RequestMapping("/")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption) 
			throws Exception {
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventSt(searchOption, 0);
		int cnt = 0;
		if(searchOption.equals("")) {
			cnt = eventMapper.getEventCurCnt();
		}
		else {
			cnt = eventMapper.getEventSearchCnt(searchOption);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", 0);
		map.put("searchType", "");
		map.put("cnt", cnt);
		map.put("endPage", (int) Math.ceil(cnt/8));
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	//taejun : 0525 17:30 진행중인 이벤트 최신일순 검색 추가
	@RequestMapping(path = "/newest", method = {RequestMethod.GET})
	public ModelAndView new_list(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventSt(searchOption, 0);
		int cnt = eventMapper.getEventSearchCnt(searchOption);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchType", "newest");
		map.put("pageIdx", 0);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 8);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	//taejun : 0525 17:30 진행중인 이벤트 마감일순 검색 추가
	@RequestMapping(path = "/deadline", method = {RequestMethod.GET})
	public ModelAndView deadline_list(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventEnd(searchOption, 0);
		int cnt = eventMapper.getEventSearchCnt(searchOption);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchType", "deadline");
		map.put("pageIdx", 0);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 8);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// taejun : 0526 11:30 진행중인 이벤트 페이징 처리 추가
	@RequestMapping("/page")
	public ModelAndView page(@RequestParam(defaultValue = "") String searchOption, HttpServletRequest request) throws Exception {
		List<EventVO> list = null;
		ModelAndView mav = new ModelAndView();
		int pageIdx = Integer.parseInt(request.getParameter("pageIdx"));
		String searchType = request.getParameter("searchType");
		searchOption = request.getParameter("searchOption");
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchType.equals("deadline")) {
			list = eventMapper.findEventEnd(searchOption, pageIdx * 8);
		}
		else {
			list = eventMapper.findEventSt(searchOption, pageIdx * 8);
		}
		int cnt = eventMapper.getEventSearchCnt(searchOption);
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchType", searchType);
		map.put("pageIdx", pageIdx);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 8);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// taejun : 0521 16:20 상세 페이지 이동 추가
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
		return "event_check";
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
