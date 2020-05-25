package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestBody;

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
	
	public void deleteEvent(int evt_idx);
	
	public void updateEvent(EventVO eventvo);
	
	public List<EventDtVO> searchEventDtList(int EvtIdx);
	
	public List<EventVO>  searchEventListPage(int PageIdx);
	
}
