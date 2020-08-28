package com.ktds.devpro.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestAttribute;

import com.ktds.devpro.model.vo.CustResVO;
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
	
	public List<EventVO> selectEventListCur(int pageIdx) {
		return sqlSession.selectList(eventVO.getEvtSt(), "1");
	}
	
	//taejun : 0525 17:30 진행중인 이벤트 시작일순 검색 Dao 추가
	public List<EventVO> findEventSt(String searchOption, int pageIdx){
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("pageIdx", String.valueOf(pageIdx));
		return sqlSession.selectList("EventDao.findEventSt", map);
	}
	
	//taejun : 0525 17:30 진행중인 이벤트 마감일순 검색 Dao 추가
	public List<EventVO> findEventEnd(String searchOption, int pageIdx){
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("pageIdx", String.valueOf(pageIdx));
		return sqlSession.selectList("EventDao.findEventEnd", map);
	}

}

