package com.ktds.devpro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

@Service
public class EventSearchServiceImpl implements EventSearchService{
	@Resource
	private EventMapper eventMapper;
	
	@Resource
	private EventDao eventDao;
	
	@Override
	public void deleteEventOne(String EvtNm) {
		int idx = this.findEventIdxByNm(EvtNm);
		eventMapper.deleteEvent(idx);
	}
	
	@Override
	public List<EventVO> findEventSt(String searchOption) {
		return eventDao.findEventSt(searchOption);
	}
	
	@Override
	public List<EventVO> findEventEnd(String searchOption) {
		return eventDao.findEventEnd(searchOption);
	}

	@Override
	public List<EventVO> searchEventAll() {
		List<EventVO> EvtList = eventMapper.findEventAll(); 
		return EvtList;
	}

	@Override
	public List<EventCtgVO> searchEventCtgAll() {
		List<EventCtgVO> EvtList = eventMapper.findEventCtgAll();
		return EvtList;
	}

	@Override
	public List<EventCtgVO> searchEventByCtg(int ctgId) {
		List<EventCtgVO> EvtList = eventMapper.findEventByCtg(ctgId);
		return EvtList;
	}

	@Override
	public void updateEventStateOne(int EvtIdx, int EvtSt) {
		EventVO eventvo = new EventVO();
		eventvo.setEvtIdx(EvtIdx);
		eventvo.setEvtSt(String.valueOf(EvtSt));
		eventMapper.updateEvent(eventvo);
	}

	@Override
	public List<EventDtVO> searchEventDtList(int EvtIdx) {
		List<EventDtVO> EventDtList = eventMapper.searchEventDtList(EvtIdx);
		return EventDtList;
	}

	@Override
	public int findEventIdxByNm(String EvtNm) {
		return eventMapper.findEventIdxByEvtnm(EvtNm);
	}

	@Override
	public List<EventVO> searchEventListPage(int PageIdx) {
		List<EventVO> EventListPage = eventMapper.searchEventListPage(PageIdx * 8);
		return EventListPage;
	}
	
}
