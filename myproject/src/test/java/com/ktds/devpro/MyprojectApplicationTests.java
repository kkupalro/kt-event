package com.ktds.devpro;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.MemberVO;
import com.ktds.devpro.service.EventSearchService;

@SpringBootTest
class MyprojectApplicationTests {
	
	@Resource
	EventMapper eventMapper;
	@Resource
	EventSearchService eventService;
	
	@Test
	void contextLoads() {
		//System.out.println(eventMapper.searchEventDtList(2).toString());
		//eventService.deleteEventOne("웹툰, 웹소설 5개월 무료! 우리카드 자동이체 이벤트");
		//System.out.println(mvo);
	}
}
