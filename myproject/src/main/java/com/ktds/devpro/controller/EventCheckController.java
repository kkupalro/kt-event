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

import com.ktds.devpro.model.mapper.ChkEventMapper;
import com.ktds.devpro.model.mapper.PastEventMapper;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class EventCheckController {
	@Autowired
	private EventSearchService eventSrcService;

	@Resource
	private PastEventMapper pasteventMapper;
	
	@Resource
	private ChkEventMapper ChkEventMapper;

	@RequestMapping(path = "/check_option", method = { RequestMethod.POST })
	public ModelAndView option(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		
		String name = request.getParameter("name");
		String id= request.getParameter("id");
		String phone = request.getParameter("phone");
		
		int pageIdx = 0;
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = null; 
		int cnt = 0; 
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(phone.equals("")) {
			list = ChkEventMapper.findEventChkId(name, id, pageIdx * 10);
			cnt = ChkEventMapper.getEventChkIdCnt(name, id);
		}
		else {
			list = ChkEventMapper.findEventChkPhone(phone, pageIdx * 10);
			cnt = ChkEventMapper.getEventChkPhoneCnt(phone);
		}
		
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", 0);
		map.put("searchWord", searchWord);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 10);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}

	@RequestMapping(path = "/check_search", method = { RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request) throws Exception {
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		int pageIdx = 0;
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = pasteventMapper.findEventSearch(searchOption, searchWord, pageIdx * 10);
		int cnt = pasteventMapper.getEventSearchCnt(searchOption, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		map.put("pageIdx", pageIdx);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 10);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}

	@RequestMapping("/check_page")
	public ModelAndView page(@RequestParam(defaultValue = "") String searchOption,
			@RequestParam(defaultValue = "") String searchWord, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int pageIdx = Integer.parseInt(request.getParameter("pageIdx"));
		searchWord = request.getParameter("searchWord");
		searchOption = request.getParameter("searchOption");
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = pasteventMapper.getEventSearchCnt(searchOption, searchWord);
		List<EventVO> list = pasteventMapper.findEventSearch(searchOption, searchWord, pageIdx * 10);
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		map.put("pageIdx", pageIdx);
		map.put("cnt", cnt);
		cnt = eventSrcService.setEndPage(cnt, 10);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}
}
