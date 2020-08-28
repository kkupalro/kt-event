package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface ChkEventMapper {
	//YE : 0828 당첨자 EventVO List 가져오는 Mapper 추가
	public List<EventVO> findEventChk(int pageIdx);
	
	//YE : 0828 이벤트 당첨리스트 건수 가져오는 Mapper 추가
	public int getEventChkCnt();
	
	//taejun : 0527 16:40  이벤트 건수 가져오는 Mapper 추가
	public List<EventVO> findEventSearch(String searchOption, String searchWord, int pageIdx);

	//taejun : 0527 16:40  검색조건에 따른 지난 이벤트 건수 가져오는 Mapper 추가
	public int getEventSearchCnt(String searchOption, String searchWord);
	
}
