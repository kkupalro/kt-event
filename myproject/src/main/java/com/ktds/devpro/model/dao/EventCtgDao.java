package com.ktds.devpro.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventVO;

@Repository
public class EventCtgDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "com.ktds.devpro.model.dao";
	
	private EventCtgVO eventCtgVO;
	
	public EventCtgDao () {
		eventCtgVO = new EventCtgVO();
	}
	
	public List<EventCtgVO> selectEventCtgListAll() {
		return sqlSession.selectList(null);
	}
	
}
