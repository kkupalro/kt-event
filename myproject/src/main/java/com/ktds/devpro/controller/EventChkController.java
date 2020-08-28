package com.ktds.devpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.devpro.model.mapper.ChkEventMapper;
import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class EventChkController {
	@Autowired
	private EventSearchService eventSrcService;
	
	@Resource
	private ChkEventMapper ChkEventMapper;

	@Resource
	private EventMapper eventMapper;
	
	
	//YE : 0828 이벤트 당첨 페이지 추가
	@RequestMapping("/check_event")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption, @RequestParam(defaultValue = "") String searchWord) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = ChkEventMapper.findEventChk(0);
		int cnt = ChkEventMapper.getEventChkCnt();
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
	
	//YE : 0828 당첨자확인 페이지 추가
	@RequestMapping("/check_detail")
	public String Chkdetail(HttpServletRequest request,HttpSession session, Model model) {
		int evtIdx = Integer.parseInt(request.getParameter("id"));
		String custId = String.valueOf(session.getAttribute("custId"));
		List<EventVO> vo = eventMapper.findEventByIdx(evtIdx);
		List<EventDtVO> dt_vo = eventMapper.searchEventDtList(evtIdx);
		
		String checkID = ChkEventMapper.checkCustID(custId, evtIdx);
		
		//String checkID = eventSrcService.checkCustID(custId, evtIdx);
		System.out.println(checkID);
		model.addAttribute("evt_dt", dt_vo);
		model.addAttribute("evt", vo);
		model.addAttribute("checkID", checkID);
		return "check_detail";
	}

}
