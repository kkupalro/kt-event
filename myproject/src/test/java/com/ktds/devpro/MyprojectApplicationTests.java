package com.ktds.devpro;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.MemberVO;

@SpringBootTest
class MyprojectApplicationTests {
	
	@Resource
	MemberMapper memberMapper;
	@Test
	void contextLoads() {
		MemberVO mvo=memberMapper.findMemberById("java");
		System.out.println(mvo);
	}
}
