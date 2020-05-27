package com.ktds.devpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.devpro.model.mapper.PastEventMapper;
import com.ktds.devpro.model.vo.EventVO;

@Controller
public class EventPastController {
	@Resource
	private PastEventMapper pasteventMapper;

	// 지난 이벤트
	@RequestMapping("/past_event")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption, @RequestParam(defaultValue = "") String searchWord) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = pasteventMapper.findEventPast(0);
		int cnt = pasteventMapper.getEventPastCnt();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", 0);
		map.put("searchWord", searchWord);
		map.put("cnt", cnt);
		
		// 전체 건수 20개 일때 20/10 = 2 => 총 페이지는 0, 1, 2 가 되는데 실제 번호 출력값은 1, 2, 3이므로 -1을 빼면 = 실제 페이지 1, 2
		if(cnt > 0 && cnt % 10 == 0) {
			cnt = (int)Math.ceil(cnt/10) -1;
		}
		else {
			cnt = (int)Math.ceil(cnt/10);
		}
		
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("past_event");
		return mav;
	}

	// 이벤트명 검색
	@RequestMapping(path = "/past_search", method = { RequestMethod.POST })
	public ModelAndView new_list(HttpServletRequest request) throws Exception {
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
		
		if(cnt > 0 && cnt % 10 == 0) {
			cnt = (int)Math.ceil(cnt/10) -1;
		}
		else {
			cnt = (int)Math.ceil(cnt/10);
		}
		
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("past_event");
		return mav;
	}

	// 페이지 이동
	@RequestMapping("/past_page")
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
		
		if(cnt > 0 && cnt % 10 == 0) {
			cnt = (int)Math.ceil(cnt/10) -1;
		}
		else {
			cnt = (int)Math.ceil(cnt/10);
		}
		
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("past_event");
		return mav;
	}
}
