package com.ktds.devpro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;
import com.ktds.devpro.service.EventSearchService;

@RestController
public class EventSearchController {
	
	@Autowired
	private EventSearchService eventService;
	
	@Resource
	private EventMapper eventMapper;
	
	@RequestMapping("/evt/search")		//controller test용, 접속시 빈 VO 2개  json반환
	public Object EventSearch() {
		List<EventVO> EvtList = new ArrayList<>();
		EventVO test1 = new EventVO();
		EventVO test2 = new EventVO();
		EvtList.add(test1);
		EvtList.add(test2);
		return EvtList;
	}
	@RequestMapping(path = "/evt/search/{evt_nm}", method = {RequestMethod.DELETE,RequestMethod.GET}) //Evnet delete API
	public void EventDelete(@PathVariable String evt_nm) {
		//eventMapper.deleteEvent(evt_nm);
		eventService.deleteEventOne(evt_nm);
	}
	
	@RequestMapping("/evt/searchAll") // Eevnt 전체 select
	public List<EventVO> EventSearchAll() {
		List<EventVO> EvtList = eventService.searchEventAll(); 
		return EvtList;
	}
	
	@RequestMapping("/evt/searchCtg")	//Event category List json 반환
	public List<EventCtgVO> EventSearchCtgAll() {
		List<EventCtgVO> EvtList = eventService.searchEventCtgAll();
		return EvtList;
	}
	
	
	@RequestMapping("/evt/searchCtgList/{ctgId}")	//category별 이벤트 조회
	public List<EventCtgVO> EventSearchByCtg(@PathVariable int ctgId) {
		List<EventCtgVO> EvtList = eventService.searchEventByCtg(ctgId);
		return EvtList;
	}

	@RequestMapping("/evt/updateEvtSt/{EvtIdx}/{EvtSt}")	//Event state 수정
	public void Update(@PathVariable int EvtIdx,@PathVariable int EvtSt) {
		EventVO eventvo = new EventVO();
		eventvo.setEvtIdx(EvtIdx);
//		eventvo.setEvtSt(EvtSt);
		eventMapper.updateEvent(eventvo);
		eventService.updateEventStateOne(EvtIdx, EvtSt);
	}
	
	@RequestMapping("/evt/searchEventDtList/{EvtIdx}")		//Event Detail VO json return
	public List<EventDtVO> findEventDtList(@PathVariable int EvtIdx)
	{
		List<EventDtVO> EventDtList = eventService.searchEventDtList(EvtIdx);
		return EventDtList;
	}
	
	@RequestMapping("/evt/searchEventListPage/{PageIdx}")	// Event Paging 처리, ex, 첫번쨰 페이지 -> /1로 주면 됨
	public List<EventVO> EventListPage(@PathVariable int PageIdx)
	{
		List<EventVO> EvtList = eventService.searchEventListPage(PageIdx);
		
		return EvtList;
	}
	
	
}
