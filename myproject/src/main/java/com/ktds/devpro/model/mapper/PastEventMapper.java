package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface PastEventMapper {
	// 0828 15:30 당첨자확인 EventVO List 가져오는 Mapper 추가
	public List<EventVO> findEventWinners();
	
	//taejun : 0528 16:50  당첨자확인 이벤트 조건별 검색 Mapper 추가
	public List<EventVO> searchEventWinners(String searchOption);
	
	//taejun : 0527 16:40  지난 이벤트 EventVO List 가져오는 Mapper 추가
	public List<EventVO> findEventPast(int pageIdx);
	
	//taejun : 0527 16:40  이벤트 건수 가져오는 Mapper 추가
	public int getEventPastCnt();
	
	//taejun : 0527 16:40  이벤트 건수 가져오는 Mapper 추가
	public List<EventVO> findEventSearch(String searchOption, String searchWord, int pageIdx);
	
	//taejun : 0527 16:40  검색조건에 따른 지난 이벤트 건수 가져오는 Mapper 추가
	public int getEventSearchCnt(String searchOption, String searchWord);
	
	// 0828 17:50 당첨자확인 건수 가져오는 Mapper 추가
	public int getEventWinnersCnt(String searchOption);
}
