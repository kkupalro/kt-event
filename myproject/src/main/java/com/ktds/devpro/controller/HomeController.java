package com.ktds.devpro.controller;

import java.io.Console;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	// taejun : 0525 17:30 메인 이벤트(홈) 추가
	@RequestMapping("/")
	public ModelAndView list(@RequestParam(defaultValue = "") String searchOption) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<EventVO> list = eventMapper.findEventSt(searchOption, 0);
		int cnt = 0;
		int endPage = 0;
		if (searchOption.equals("")) {
			cnt = eventMapper.getEventCurCnt();
		} else {
			cnt = eventMapper.getEventSearchCnt(searchOption);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchOption", searchOption);
		map.put("pageIdx", 0);
		map.put("searchType", "");
		map.put("cnt", cnt);
		endPage = (int) Math.ceil(cnt / 8);
		if(cnt % 8 == 0) {
			endPage -= 1;
		}
		map.put("endPage", endPage);
		mav.addObject("map", map);
		mav.setViewName("curr_event");
		return mav;
	}

	// taejun : 0525 17:30 진행중인 이벤트 최신일순 검색 추가
	@RequestMapping(path = "/newest", method = { RequestMethod.GET })
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

	// taejun : 0525 17:30 진행중인 이벤트 마감일순 검색 추가
	@RequestMapping(path = "/deadline", method = { RequestMethod.GET })
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
	public ModelAndView page(@RequestParam(defaultValue = "") String searchOption, HttpServletRequest request)
			throws Exception {
		List<EventVO> list = null;
		ModelAndView mav = new ModelAndView();
		int pageIdx = Integer.parseInt(request.getParameter("pageIdx"));
		String searchType = request.getParameter("searchType");
		searchOption = request.getParameter("searchOption");
		Map<String, Object> map = new HashMap<String, Object>();
		if (searchType.equals("deadline")) {
			list = eventMapper.findEventEnd(searchOption, pageIdx * 8);
		} else {
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

	// 0731 14:26 이벤트 신청하기 추가
	@RequestMapping("/event_enrollment")
	public void enrollment(HttpSession session, HttpServletResponse response,HttpServletRequest request, Model model) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		 

		if (session.getAttribute("custId") != null) {
			String evtIdx = request.getParameter("evt_idx");
			String custId = session.getAttribute("custId").toString();
			String custIdx = memberMapper.selectMemberid(custId);
			Random random = new Random();
			String prize = random.nextInt(100) % 5 == 0 ? "2" : "1";
			// 2 : 당첨, 1 : 비당첨
			
			int cnt = memberMapper.countEventenrollment(custIdx);
			if(cnt > 5) {
				// 진행중인 이벤트 건수 5개 넘으면 신청 불가능
				out.println("<script>alert('진행중인 이벤트 신청 건수가 5개 넘으면 신청 불가능');location.href='/';</script>");
				
			}
			else {
				int dup_cnt = memberMapper.checkEventenrollment(custIdx, evtIdx);
				// 이벤트 신청
				if(dup_cnt == 0) {
					// 신청 완료
					out.println("<script>alert('이벤트 신청 완료');location.href='/';</script>");
					memberMapper.InsertMemberPrize(evtIdx, custIdx, prize);
				}
				else {
					// 이벤트 중복 신청
					out.println("<script>alert('이벤트 중복 신청');location.href='/';</script>");
				}
			}
			
		}
		else {
			out.println("<script>alert('로그인 후 이용해 주세요.');location.href='/login';</script>");
		}
		out.flush();
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
