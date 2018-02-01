package api;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import constant.Constant;

public class WeatherAPI {
	
	@SuppressWarnings("unchecked")
//	public static void main(String[] args) throws IOException {
	public static JsonNode getWeather(int arg) throws IOException {
		int arg1 = 3;
		
		// 날씨 , 온도
		String[] categories = { "LandWeather", "Temperature" };
		
		// 2차원 배열  첫번째는 날씨에 관한 배열 두번째는 온도에 대한 배열
		String[][] codes = {{"11B00000", "11B10101"}, {"11D10000", "11D20501"}, {"11D20000", "11D10401"}, {"11C20000", "11C20401"}, {"11C10000", "11C10301"},
				{"11F20000", "11F20501"}, {"11F10000", "21F10501"}, {"11H10000", "11H10701"}, {"11H20000", "11H20201"}, {"11G00000", "11G00201"}};
		
		//SimpleDateFormat 으로 데이터에 알맞게 포맷해준다
		String today = new SimpleDateFormat("yyyyMMdd").format(new Date()) + "0600";
		
		XmlMapper xmlMapper = new XmlMapper();
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object>[] weathers = new Map[codes.length];
		for (int i = 0; i < codes.length; i++) {
			
			Map<String, Object> weather = new HashMap<>();
			
			for(int j = 0; j < categories.length; j++) {
				
				JsonNode jsonNode = xmlMapper.readTree(new URL("http://newsky2.kma.go.kr/service/MiddleFrcstInfoService"
						+ "/getMiddle" + categories[j] + "?ServiceKey=" + Constant.WEATHER
						+ "&regId=" + codes[i][j] + "&tmFc=" + today + "&pageNo=1" + "&numOfRows=10"))
						.path("body").path("items").path("item");
				
				for(Entry<String, Object> entry : ((Map<String, Object>)objectMapper.convertValue(jsonNode, Map.class)).entrySet()) {
					if(entry.getKey().matches("[^0-9]*"+arg1+"[^0-9]*"))
						weather.put(entry.getKey().replaceAll(Integer.toString(arg1), ""), entry.getValue());
				}
				
			}
			weathers[i] = weather;
			
		}
		
		System.out.println(objectMapper.convertValue(weathers, JsonNode.class));
		return objectMapper.convertValue(weathers, JsonNode.class);
		
	} //getWeather();
	
} //class WeatherAPI
