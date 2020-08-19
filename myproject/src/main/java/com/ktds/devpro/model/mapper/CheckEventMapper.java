package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface CheckEventMapper {

	public List<EventVO> findEventPast(int pageIdx);
	public int getEventPastCnt();
	public List<EventVO> findEventSearch(String searchOption, String searchWord, int pageIdx);
	public int getEventSearchCnt(String searchOption, String searchWord);
	
}
