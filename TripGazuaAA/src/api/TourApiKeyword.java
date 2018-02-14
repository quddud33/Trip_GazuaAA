package api;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;


import com.fasterxml.jackson.databind.ObjectMapper;
import constant.Constant;


import java.io.IOException;

public class TourApiKeyword {
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyMMdd");
	
	public static void main(String[] args) throws IOException {
		String today = DATE_FORMAT.format(new Date());
		System.out.println(today);
	

			Document document = Jsoup.connect(
					"http://api.visitkorea.or.kr/openapi/service/rest/KorService" + "/searchFestival?ServiceKey="
					+ Constant.TOURKEY + "&numOfRows=10" + "&pageNo=1" + "&MobileOS=ETC" + "&MobileApp=AppTest"
					+ "&arrange=A" + "&listYN=Y" + "&areaCode=&sigunguCode=" + "&eventStartDate=" + today).get();

			List<Map<String, String>> festivalList = new ArrayList<>();
			Map<String, String> festival;

			for (Element element : document.select("item")) {

				festivalList.add(festival = new HashMap<>());
				
				festival.put("title", element.select("title").text());
				festival.put("lat", element.select("mapy").text());
				festival.put("lng", element.select("mapx").text());
				festival.put("addr", element.select("addr1").text());
				festival.put("img", element.select("firstimage").text());

			}
			
			new ObjectMapper().writeValueAsString(Collections.singletonMap("positions", festivalList));
			
		
	}

}
