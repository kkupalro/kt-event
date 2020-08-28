package com.ktds.devpro.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.vo.EventCtgVO;
import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

//@Service
public interface EventSearchService {
	public void 			deleteEventOne(String evt_nm);
	public List<EventVO> 	searchEventAll();
	public List<EventCtgVO> searchEventCtgAll();
	public List<EventCtgVO> searchEventByCtg(int ctgId);
	public void 			updateEventStateOne(int EvtIdx, int EvtSt);
	public List<EventDtVO> 	searchEventDtList(int EvtIdx);
	public int 				findEventIdxByNm(String EVtNm);
	public List<EventVO>	searchEventListPage(int PageIdx);
	public List<EventVO>	findEventSt(String searchOption, int PageIdx);
	public List<EventVO>	findEventEnd(String searchOption, int PageIdx);
	public int 				getEventSearchCnt(String searchOption);
	public int				getEventCurCnt();
	public int				setEndPage(int cnt, int pagecnt);

}
