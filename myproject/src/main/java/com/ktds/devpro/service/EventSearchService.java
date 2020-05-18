package com.ktds.devpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.dao.EventDao;
import com.ktds.devpro.model.vo.EventVO;

//@Service
public interface EventSearchService {
	public List<EventVO> selectEventAll();
}
