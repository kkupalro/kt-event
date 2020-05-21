package com.ktds.devpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.vo.EventVO;

@Service
public class EventSearchServiceImpl implements EventSearchService{

	@Autowired
	private EventDao eventDao;
	
	List<EventVO> EventList;
	
	@Override
	public List<EventVO> selectEventAll() {
		return eventDao.selectEventListAll();
	}
	
	@Override
	public List<EventVO> selectEventCur() {
		return eventDao.selectEventListCur();
	}
}
