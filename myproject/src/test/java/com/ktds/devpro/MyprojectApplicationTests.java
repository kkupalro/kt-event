package com.ktds.devpro;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ktds.devpro.model.mapper.EventMapper;
import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.MemberVO;

@SpringBootTest
class MyprojectApplicationTests {
	
	@Resource
	EventMapper eventMapper;
	
	
	@Test
	void contextLoads() {
		System.out.println(eventMapper.searchEventDtList(2).toString());
		//System.out.println(mvo);
	}
}
