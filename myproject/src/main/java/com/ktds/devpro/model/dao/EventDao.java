package com.ktds.devpro.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.devpro.model.vo.EventVO;

@Repository
public class EventDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "com.ktds.devpro.model.dao";
	
	private EventVO eventVO;
	
	public EventDao () {
		eventVO = new EventVO();
	}
	
	public List<EventVO> selectEventListAll() {
		return sqlSession.selectList(null);
	}
	
	public List<EventVO> selectEventListCur() {
		return sqlSession.selectList(""+eventVO.getEvtSt(), "1");
	}

}
