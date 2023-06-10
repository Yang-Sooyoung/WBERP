package com.wberp.ibk.web.eis.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wberp.ibk.web.eis.service.IattchBoardService;

@Controller
public class attchBoardController {
	@Autowired
	public IattchBoardService iattchBoardService;
	
	@RequestMapping(value = "/atchList")
	public ModelAndView attchBoard(@RequestParam HashMap<String, String> params,
								  ModelAndView mav) throws Throwable{
		
		List<HashMap<String, String>> list = iattchBoardService.getattchBoard(params);
		
		mav.addObject("list", list);
		
		mav.setViewName("eis/attchBoard");
		
		return mav; 
	}
}
