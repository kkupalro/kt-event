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
public class EventChkController {
	@Autowired
	private EventSearchService eventSrcService;
	
	@Resource
	private PastEventMapper pasteventMapper;

	//taejun : 0527 16:40 지난 이벤트 페이지 추가
	@RequestMapping("/check")
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
		cnt = eventSrcService.setEndPage(cnt, 10);
		map.put("endPage", cnt);
		mav.addObject("map", map);
		mav.setViewName("check_event");
		return mav;
	}

//	/*
//	 * //taejun : 0527 16:40 이벤트명 검색 추가
//	 * 
//	 * @RequestMapping(path = "/past_search", method = { RequestMethod.POST })
//	 * public ModelAndView new_list(HttpServletRequest request) throws Exception {
//	 * String searchOption = request.getParameter("searchOption"); String searchWord
//	 * = request.getParameter("searchWord"); int pageIdx = 0; ModelAndView mav = new
//	 * ModelAndView(); List<EventVO> list =
//	 * pasteventMapper.findEventSearch(searchOption, searchWord, pageIdx * 10); int
//	 * cnt = pasteventMapper.getEventSearchCnt(searchOption, searchWord);
//	 * Map<String, Object> map = new HashMap<String, Object>(); map.put("list",
//	 * list); map.put("searchOption", searchOption); map.put("searchWord",
//	 * searchWord); map.put("pageIdx", pageIdx); map.put("cnt", cnt); cnt =
//	 * eventSrcService.setEndPage(cnt, 10); map.put("endPage", cnt);
//	 * mav.addObject("map", map); mav.setViewName("past_event"); return mav; }
//	 * 
//	 * //taejun : 0527 16:40 지난 이벤트 페이징 추가
//	 * 
//	 * @RequestMapping("/past_page") public ModelAndView
//	 * page(@RequestParam(defaultValue = "") String searchOption,
//	 * 
//	 * @RequestParam(defaultValue = "") String searchWord, HttpServletRequest
//	 * request) throws Exception { ModelAndView mav = new ModelAndView(); int
//	 * pageIdx = Integer.parseInt(request.getParameter("pageIdx")); searchWord =
//	 * request.getParameter("searchWord"); searchOption =
//	 * request.getParameter("searchOption"); Map<String, Object> map = new
//	 * HashMap<String, Object>(); int cnt =
//	 * pasteventMapper.getEventSearchCnt(searchOption, searchWord); List<EventVO>
//	 * list = pasteventMapper.findEventSearch(searchOption, searchWord, pageIdx *
//	 * 10); map.put("list", list); map.put("searchOption", searchOption);
//	 * map.put("searchWord", searchWord); map.put("pageIdx", pageIdx);
//	 * map.put("cnt", cnt); cnt = eventSrcService.setEndPage(cnt, 10);
//	 * map.put("endPage", cnt); mav.addObject("map", map);
//	 * mav.setViewName("past_event"); return mav; }
//	 */
}
