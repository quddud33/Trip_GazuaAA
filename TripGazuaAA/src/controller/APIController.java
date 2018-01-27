package controller;

import javax.servlet.http.HttpSession;

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
	
	//硫붿씤�럹�씠吏�
	@RequestMapping("index.do")
	public ModelAndView getFestvalInfo() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("festvalInfo", service.getFestivalInfo());
		mav.setViewName("index");
		
		return mav;
	}
	
	//�닕�냼,留쏆쭛,異뺤젣 寃��깋�럹�씠吏�
	@RequestMapping("contentList.do")
	public ModelAndView getSearch(@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue="") String contentTypeId, 
			@RequestParam(defaultValue="") String areaCode) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchInfo", service.searchAPIInfo(search, contentTypeId, areaCode));
		mav.setViewName("contentList");
		return mav;
	}
	
	//�긽�꽭�젙蹂�(愿�愿묒�, �닕諛�)
	@RequestMapping("contentView.do")
	public ModelAndView roomDetail(@RequestParam String contentid, @RequestParam String contenttypeid) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("detail",service.Detail(contentid, contenttypeid));
		mav.setViewName("contentView");
		return mav;
	}
	//異붿쿇�븯湲� 由ъ뒪�듃 api �뿰�룞
	@RequestMapping("main.do")
	public ModelAndView image(HttpSession session, @RequestParam(defaultValue = "")String contentTypeId,
			@RequestParam(defaultValue = "")String contentId) throws Exception{
		ModelAndView mav = new ModelAndView();
		session.setAttribute("msg", "");
		mav.addObject("main", service.image(contentTypeId, contentId));
		mav.setViewName("main");
		return mav;
	}





}
