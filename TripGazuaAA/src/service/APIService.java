package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import constant.Key;
import dao.IReviewDao;

@Service
public class APIService {
	String contentid2;
	
	@Autowired
	IReviewDao rDao;
	
	//공공정보조회
	public List<HashMap<String, String>> commonInfo(String contentid, String contenttypeid) throws Exception{
		List<HashMap<String, String>> result = new ArrayList<>();
		HashMap<String, String> value = new HashMap<>();
		
	    StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + constant.Constant.TOURKEY); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("SERVICE_KEY", "UTF-8")); /*서비스인증*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*콘텐츠 ID*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*기본정보 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*원본, 썸네일 대표이미지 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*서비스분류코드(대,중,소 코드) 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*주소, 상세주소 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*좌표 X,Y 조회여부*/
        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();

        parser.setInput(new InputStreamReader(conn.getInputStream()));

        

        for(int eventType = parser.getEventType(); eventType != XmlPullParser.END_DOCUMENT; eventType = parser.next()) {

        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("item")) {

        		for(eventType = parser.next(); eventType != XmlPullParser.END_TAG || !parser.getName().equals("item"); eventType = parser.next()) {

    				
        			if(eventType == XmlPullParser.START_TAG)

        				value.put(parser.getName(), parser.nextText()); //HashMap안에 값을 담아줌

        			}
        		result.add(value); //result안에 HashMap담기
        		
        		value = new HashMap<String, String>(); //HashMap값 초기화(다른값을 다시 담으려고)

        	}
        	

        }
        
        rd.close();
        conn.disconnect();
		
        
		return result;
	}
	
	//키워드 검색
	public List<HashMap<String, String>> searchAPIInfo(String search, String contenttypeid, String areaCode,String page) throws Exception {
		List<HashMap<String, String>> result = new ArrayList<>();
		HashMap<String, String> value = new HashMap<>(); //검색값을 담아줄 HashMap선언
	
       StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +constant.Key.DAUMKEY); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("SERVICE_KEY", "UTF-8")); /*공공데이터에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("sample", "UTF-8")); /*서비스명*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*AND(안드로이드),IOS,ETC(web)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*표출건수*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(search, "UTF-8")); /*키워드*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /*지역코드(areaCode 없을때), 시군구코드(areaCode=1)*/
        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*지역코드(areaCode 없을때), 시군구코드(areaCode=1)*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류코드*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류코드(대분류코드 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류코드(중분류,대분류코드 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*A=제목순,B=인기순,C=최근수정순,D=등록순*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        

        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();

        parser.setInput(new InputStreamReader(conn.getInputStream()));

        

        for(int eventType = parser.getEventType(); eventType != XmlPullParser.END_DOCUMENT; eventType = parser.next()) {

        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("item")) {

        		for(eventType = parser.next(); eventType != XmlPullParser.END_TAG || !parser.getName().equals("item"); eventType = parser.next()) {

    				
        			if(eventType == XmlPullParser.START_TAG)

        				value.put(parser.getName(), parser.nextText()); //HashMap안에 값을 담아줌

        			}
        		
        		if(contenttypeid.equals("32"))
        			value.put("price", String.valueOf((int) (Math.random() * 1000) * 100));
        		
        		result.add(value); //result안에 HashMap담기
        		
        		value = new HashMap<String, String>(); //HashMap값 초기화(다른값을 다시 담으려고)
        	}
        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("totalCount")) {
    	    	value.put(parser.getName(), parser.nextText());
    	    	
    	    	result.add(value);
    	    	value = new HashMap<String, String>();
    		}
        }

 
        rd.close();

        conn.disconnect();
	
        return result;
	}	
	
	//반복정보조회(숙소 사진 등)
	public List<HashMap<String, String>> detailInfo(String contentid, String contenttypeid) throws Exception {
		List<HashMap<String, String>> result = new ArrayList<>();
		HashMap<String, String> value = new HashMap<>();
		 StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + constant.Constant.TOURKEY); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("Servicekey","UTF-8") + "=" + URLEncoder.encode("인증키", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*콘텐츠 ID*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*관광타입(관광지, 숙박 등)ID*/
	        urlBuilder.append("&" + URLEncoder.encode("detailYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*반복정보 조회여부*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
	        parser.setInput(new InputStreamReader(conn.getInputStream()));

	        for(int eventType = parser.getEventType(); eventType != XmlPullParser.END_DOCUMENT; eventType = parser.next()) {
	        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("item")) {
	        		for(eventType = parser.next(); eventType != XmlPullParser.END_TAG || !parser.getName().equals("item"); eventType = parser.next()) {
	        			if(eventType == XmlPullParser.START_TAG)
	        				value.put(parser.getName(), parser.nextText());
	        			}
    				result.add(value);
    				value = new HashMap<String, String>(); //초기화 안하면 같은값만 들어감

    	        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("totalCount")) {
    	        	    	value.put(parser.getName(), parser.nextText());
    	        	    	result.add(value);
    	        	    	value = new HashMap<String, String>();
    	        	}
	        	}
	        }
			return result;
	}
	
	//위치기반 정보조회(숙소, 맛집, 축제 등)
	public List<HashMap<String, String>> areaBased(String areacode, String contentid,String page,String contenttypeid) throws Exception {
		List<HashMap<String, String>> result = new ArrayList<>();
		HashMap<String, String> value = new HashMap<>();
		
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +constant.Constant.TOURKEY); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("SERVICE_KEY", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰), AND(안드로이드), WIN(원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*콘텐츠 ID*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areacode, "UTF-8")); /*지역코드(areaCode 없을때), 시군구코드(areaCode=1)*/
        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*지역코드(areaCode 없을때), 시군구코드(areaCode=1)*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류코드*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류코드(대분류코드 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류코드(중분류,대분류코드 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*A=제목순,B=인기순,C=최근수정순,D=등록순*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        
        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();

        parser.setInput(new InputStreamReader(conn.getInputStream()));

        

        for(int eventType = parser.getEventType(); eventType != XmlPullParser.END_DOCUMENT; eventType = parser.next()) {

        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("item")) {

        		for(eventType = parser.next(); eventType != XmlPullParser.END_TAG || !parser.getName().equals("item"); eventType = parser.next()) {

        			if(eventType == XmlPullParser.START_TAG)
        				value.put(parser.getName(), parser.nextText());
        			}

       				value.put("price", String.valueOf((int) (Math.random() * 1000) * 100));
        			
        			result.add(value);
        			value = new HashMap<String, String>();
        	}
        	
        	if(eventType == XmlPullParser.START_TAG && parser.getName().equals("totalCount")) {
        	    	value.put(parser.getName(), parser.nextText());
        	    	result.add(value);
        	    	value = new HashMap<String, String>();
        	}

        }
        
        
        rd.close();
        conn.disconnect();
		
		return result;
	}


	// 추천하기 리스트 api 연동
	public List<HashMap<String, String>> festival(String str) throws Exception {
		List<HashMap<String, String>> result = new ArrayList();// 검색값을 담아줄 HashMap선언
		HashMap<String, String> value = null;
		List<HashMap<String, String>> List = null;
		if(str.equals("Festival")) {
			List=rDao.topSelectFestival();
		}
		else if(str.equals("Country")) {
			List=rDao.topSelectCountry();
		}else if (str.equals("Restaurant")) {
			List=rDao.topSelectRestaurant();
		}
		for (int i = 0; i < List.size(); i++) {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")+ "=9HZQmtjIkur6iyfPIGo7geVL7zZg%2F4G0sYllDJZH8zTueXqSUtz2Doyj%2BNEAB7Czqo8%2BFub9NIku30J2zVMxFQ%3D%3D"); 
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="+URLEncoder.encode("SERVICE_KEY", "UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
		    urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		    urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		    urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(List.get(i).get("contentID"), "UTF-8")); /*콘텐츠 ID*/
		    urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(List.get(i).get("contentTypeID"), "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
		    urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*원본, 썸네일 대표이미지 조회여부*/
		    urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드 조회여부*/
		    urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*서비스분류코드(대,중,소 코드) 조회여부*/
		    urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*주소, 상세주소 조회여부*/
		    urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*좌표 X,Y 조회여부*/
		    urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
			parser.setInput(new InputStreamReader(conn.getInputStream()));
			for (int eventType = parser.getEventType(); eventType != XmlPullParser.END_DOCUMENT; eventType = parser
					.next()) {
				if (eventType == XmlPullParser.START_TAG && parser.getName().equals("item")) {
					value = new HashMap<String, String>();
					for (eventType = parser.next(); eventType != XmlPullParser.END_TAG
							|| !parser.getName().equals("item"); eventType = parser.next()) {
						if (eventType == XmlPullParser.START_TAG)
							value.put(parser.getName(), parser.nextText());
					}
					result.add(value);
//					System.out.println();
				}
			}
			for (HashMap<String, String> v : result)
				System.out.println(v);
		
			rd.close();
			conn.disconnect();
		}
		return result;
	}
}


