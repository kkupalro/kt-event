package com.ktds.devpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.devpro.model.mapper.PastEventMapper;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class EventCheckController {	
	@Resource
	private PastEventMapper pasteventMapper;

	@RequestMapping("/check_event")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption, @RequestParam(defaultValue = "") String searchWord) throws Exception {
		// 3개월
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = pasteventMapper.findEventWinners();
		int cnt = pasteventMapper.getEventWinnersCnt(searchOption);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("cnt", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}

	@RequestMapping(path = "/check_search", method = { RequestMethod.POST })
	public ModelAndView new_list(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = pasteventMapper.searchEventWinners(searchOption);
		int cnt = pasteventMapper.getEventWinnersCnt(searchOption);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("cnt", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}
}
