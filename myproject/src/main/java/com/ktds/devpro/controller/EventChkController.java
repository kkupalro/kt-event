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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.devpro.model.mapper.ChkEventMapper;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@Controller
public class EventChkController {
	@Autowired
	private EventSearchService eventSrcService;
	
	@Resource
	private ChkEventMapper ChkEventMapper;

	//YE : 0828 이벤트 당첨 페이지 추가
	@RequestMapping("/check")
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
	
	
	@RequestMapping(value = "/user/custidCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("userId") String id_text, @RequestParam("evtIdx") String evtidx) {
		System.out.println(ChkEventMapper.getEventChkCust(evtidx, id_text));
		return ChkEventMapper.getEventChkCust(evtidx, id_text);
	}
}
