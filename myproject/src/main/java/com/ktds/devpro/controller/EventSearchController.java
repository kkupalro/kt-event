package com.ktds.devpro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventVO;

@RestController
public class EventSearchController {
	
	@Resource
	private EventMapper eventMapper;
	
	@RequestMapping("/evt/search")
	public Object EventSearch() {
		List<EventVO> EvtList = new ArrayList<>();
		EventVO test1 = new EventVO();
		EventVO test2 = new EventVO();
		EvtList.add(test1);
		EvtList.add(test2);
		return EvtList;
	}
	
	@RequestMapping("/evt/searchAll")
	public List<EventVO> EventSearchAll() {
		//List<EventVO> EvtList = new ArrayList<>();
		List<EventVO> EvtList = eventMapper.findEventAll();
		 
		return EvtList;
	}
	
	@RequestMapping("/evt/searchCtg")
	public List<EventCtgVO> EventSearchCtgAll() {
		List<EventCtgVO> EvtList = eventMapper.findEventCtgAll();
		 
		return EvtList;
	}

}
