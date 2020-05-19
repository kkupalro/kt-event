package com.ktds.devpro.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ktds.devpro.model.vo.EventVO;

@Mapper
public interface EventMapper {
	public List<EventVO> findEventAll();
}
