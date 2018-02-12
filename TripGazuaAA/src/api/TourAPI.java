package api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TourAPI {
	
	private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
	
	private static final String SERVICE_KEY = "9HZQmtjIkur6iyfPIGo7geVL7zZg%2F4G0sYllDJZH8zTueXqSUtz2Doyj%2BNEAB7Czqo8%2BFub9NIku30J2zVMxFQ%3D%3D";
	
	public static JsonNode getTouristInformation(int contentTypeId, String areaCode, int page) {
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			
			Document document = Jsoup.connect("http://api.visitkorea.or.kr"
					+ "/openapi/service/rest/KorService/areaBasedList"
					+ "?ServiceKey=" + SERVICE_KEY
					+ "&MobileApp=Trip_GazuaAA" + "&MobileOS=ETC" + "&arrange=A"
					+ "&contentTypeId=" + contentTypeId
					+ "&areaCode=" + areaCode + "&pageNo=" + page).get();
			
			result.put("total", Integer.parseInt(document.select("totalCount").text()));
			
			List<Object> items = new ArrayList<>();
			result.put("items", items);
			
			for(Element itemElement : document.select("item")) {
				
				Map<String, Object> item = new HashMap<>();
				items.add(item);
				
				item.put("no", Integer.parseInt(itemElement.select("contentid").text()));
				item.put("contenttypeid", itemElement.select("contenttypeid").text());
				item.put("title", itemElement.select("title").text());
				item.put("addr", itemElement.select("addr1").text());
				
				if(itemElement.select("contenttypeid").text().equals("32")) {
					item.put("price", String.valueOf((int) (Math.random() * 1000) * 100));
				}
				
				Elements image;
				if((image = itemElement.select("firstimage")).size() != 0)
					item.put("img", image.text());
				
			}
			
			
		}catch (IOException e) { e.printStackTrace(); }
		
		return OBJECT_MAPPER.convertValue(result, JsonNode.class);
		
	} //getTouristInformation();
	
} // class MainApp2;
