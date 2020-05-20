package com.ktds.devpro.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventSearchController {
	
	@RequestMapping("/e")
	public String EventSarchController() {
//		List<Map<String, String>> EvtList;
		return "aa";
	}
}
