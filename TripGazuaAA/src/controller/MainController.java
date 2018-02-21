package controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import api.TourAPI;

@Controller
public class MainController {
	
	@RequestMapping(value = "ajax/touristInfo.do", params = { "contentTypeId", "areaCode", "page" })
	public ResponseEntity<String> touristInfo(int contentTypeId, String areaCode, int page) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-type", "application/json;charset=\"UTF-8\"");

		return new ResponseEntity<>(TourAPI.getTouristInformation(contentTypeId, areaCode, page).toString(), headers, HttpStatus.OK);
		
	} //touristInfo()
	
} //class MainController;
