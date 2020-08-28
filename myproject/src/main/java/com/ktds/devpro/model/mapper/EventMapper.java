package com.ktds.devpro.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.CustResVO;
import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface EventMapper {
	public List<EventVO> findEventAll();
	
	public List<EventVO> findEventCur();
	
	public List<EventVO> findEventSt(String searchOption, int pageIdx);
	
	public List<EventVO> findEventEnd(String searchOption, int pageIdx);
	
	public List<EventVO> findEventByIdx(int evtIdx);
	
	public List<EventCtgVO> findEventCtgAll();
	
	public List<EventCtgVO> findEventByCtg(int ctgId);
	
	public int findEventIdxByEvtnm(String evt_nm);
	
	public void deleteEvent(int evtIdx);
	
	public void updateEvent(EventVO eventvo);
	
	public List<EventDtVO> searchEventDtList(int evtIdx);
	
	public List<EventVO>  searchEventListPage(int PageIdx);

	//taejun : 0526 11:30  이벤트 건수 가져오는 Mapper 추가
	public int getEventCurCnt();

	//taejun : 0526 11:30  검색조건에 따른 이벤트 건수 가져오는 Mapper 추가
	public int getEventSearchCnt(String searchOption);
	

	
}
