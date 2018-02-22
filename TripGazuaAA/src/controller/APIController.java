package controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.APIService;
import service.ReviewService;
import util.PaginateUtil;

@Controller
public class APIController {
	@Autowired
	private APIService service;
	@Autowired
	private ReviewService Rservice; 

	//숙소, 맛집, 축제 검색페이지[contentList]
	@RequestMapping(value="contentList.do", params="search")
	public ModelAndView getSearch(@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue="") String contentTypeId, 
			@RequestParam(defaultValue="") String areaCode,
			@RequestParam(defaultValue="1") String page) throws Exception {
		ModelAndView mav = new ModelAndView();
		int pageNo = Integer.parseInt(page);
		List<HashMap<String, String>> list = service.searchAPIInfo(search, contentTypeId, areaCode, page);
		String strTotal = list.get(list.size() - 1).get("totalCount");
		int total = Integer.parseInt(strTotal);
		int numPage = 10;
		int numBlock = 5;
		String url = "contentList.do?";
		String param = "areaCode=" + areaCode + "&contentTypeId=" + contentTypeId + "&search=" + search + "&page=";
		mav.addObject("paginate",PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param));
		mav.addObject("contentList", service.searchAPIInfo(search, contentTypeId, areaCode,page));
		mav.addObject("page",page);
		mav.setViewName("contentList");
		return mav;
	}

	//숙소, 맛집, 축제  리스트(검색전) [contentList]
	@RequestMapping("contentList.do")
	public ModelAndView contentList(@RequestParam(defaultValue="1") String areacode, 
			@RequestParam(defaultValue="") String contentid,
			@RequestParam(defaultValue="1") String page,
			@RequestParam(defaultValue="32") String contenttypeid) throws Exception {
		ModelAndView mav = new ModelAndView();
		int pageNo = Integer.parseInt(page);
		List<HashMap<String, String>> totalList = service.areaBased(areacode, contentid, page, contenttypeid);
		String strTotal = totalList.get(totalList.size() - 1).get("totalCount");
		int total = Integer.parseInt(strTotal);
		int numPage = 10;
		int numBlock = 5;
		String url = "contentList.do?";
		String param = "areacode=" + areacode + "&contentid=" + contentid + "&contenttypeid=" + contenttypeid + "&page=";
		mav.addObject("paginate",PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param));
		mav.addObject("contentList",service.areaBased(contentid,areacode,page,contenttypeid));
		mav.addObject("page",page);
		mav.setViewName("contentList");
		return mav;
	}
	//상세정보(관광지, 숙박, 축제 등) [contentView]
	@RequestMapping("contentView.do")
	public ModelAndView roomDetail(@RequestParam String contentid, @RequestParam String contenttypeid) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(contenttypeid.equals("32") || contenttypeid.equals("12")) {
			mav.addObject("detail",service.detailInfo(contentid, contenttypeid));
		}
		else if(contenttypeid.equals("15")){
			mav.addObject("commonInfo", service.commonInfo(contentid, contenttypeid));
		}
		mav.addObject("reviewL",Rservice.reviewList(contentid));
		mav.setViewName("contentView");
		return mav;
	}
	//추천하기 리스트 api 연동
	@RequestMapping("main.do")
	public ModelAndView festival() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("topListFestival", service.festival("Festival"));
		mav.addObject("topListCountry", service.festival("Country"));
		mav.addObject("topListRestaurant", service.festival("Restaurant"));
		mav.setViewName("main");
		return mav;
	}

}
