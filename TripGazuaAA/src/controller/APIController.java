package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.APIService;

@Controller
public class APIController {
	@Autowired
	private APIService service;
	
	//메인페이지
	@RequestMapping("index.do")
	public ModelAndView getFestvalInfo() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("festvalInfo", service.getFestivalInfo());
		mav.setViewName("index");
		
		return mav;
	}
	
	//숙소,맛집,축제 검색페이지
	@RequestMapping("contentList.do")
	public ModelAndView getSearch(@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue="") String contentTypeId, 
			@RequestParam(defaultValue="") String areaCode) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchInfo", service.searchAPIInfo(search, contentTypeId, areaCode));
		mav.setViewName("contentList");
		return mav;
	}
	
	//상세정보(관광지, 숙박)
	@RequestMapping("contentView.do")
	public ModelAndView roomDetail(@RequestParam String contentid, @RequestParam String contenttypeid) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("detail",service.Detail(contentid, contenttypeid));
		mav.setViewName("contentView");
		return mav;
	}
	






}
