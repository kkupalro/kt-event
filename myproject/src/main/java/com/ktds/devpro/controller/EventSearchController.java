package com.ktds.devpro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventSearchController {
	@RequestMapping("/evt/search")
	
	public String EventSarchController() {
		
		return "Aa";
	}
}