package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.EventDtVO;
import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface ChkEventMapper {
	//YE : 0828 당첨자 EventVO List 가져오는 Mapper 추가
	public List<EventVO> findEventChk(int pageIdx);
	
	// 이름, 아이디
	public List<EventVO> findEventChkId(String name, String id, int pageIdx);
	
	// 핸드폰 번호
	public List<EventVO> findEventChkPhone(String phone, int pageIdx);
	
	//YE : 0828 이벤트 당첨리스트 건수 가져오는 Mapper 추가
	public int getEventChkCnt();
	
	// 0829 옵션별 건수 검색 Mapper 추가
	public int getEventChkIdCnt(String name, String id);
	public int getEventChkPhoneCnt(String phone);
	
	//YE : 0828 이벤트 당첨 추가
	public String checkCustID(String custId, int evtIdx);
}
