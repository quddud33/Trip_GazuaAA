package api;

import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import constant.Constant;

public class WeatherAPI {
	
	private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
	private static final XmlMapper XML_MAPPER = new XmlMapper();
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyyMMdd");
	
	public static String getWeatherAsJsonString(int arg) throws IOException {
		return OBJECT_MAPPER.writeValueAsString(getWeather(arg));
	} // getWeatherJson();

	@SuppressWarnings("unchecked")
	public static Map<String, Object>[] getWeather(int arg) throws IOException {
		int arg1 = 3;
		// SimpleDateFormat 으로 데이터에 알맞게 포맷해준다
		String today = DATE_FORMAT.format(new Date());

		// 날씨 , 온도
		String[] categories = { "LandWeather", "Temperature" };

		// 2차원 배열 첫번째는 날씨에 관한 배열 두번째는 온도에 대한 배열
		String[][] codes = { { "11B00000", "11B10101" }, { "11D10000", "11D20501" }, { "11D20000", "11D10401" },
				{ "11C20000", "11C20401" }, { "11C10000", "11C10301" }, { "11F20000", "11F20501" },
				{ "11F10000", "21F10501" }, { "11H10000", "11H10701" }, { "11H20000", "11H20201" },
				{ "11G00000", "11G00201" } };

		Map<String, Object>[] weathers = new Map[codes.length];
		Map<String, Object> weather = null;

		for (int i = 0; i < codes.length; i++) {
			weather = new HashMap<>();
			for (int j = 0; j < categories.length; j++) {
				// jsonNode 에 xml 에 담긴 정보를 파라미터 로 정리해서 넘긴다.
				JsonNode jsonNode = XML_MAPPER
						.readTree(new URL("http://newsky2.kma.go.kr/service/MiddleFrcstInfoService" + "/getMiddle"
								+ categories[j] + "?ServiceKey=" + Constant.WEATHER + "&regId=" + codes[i][j] + "&tmFc="
								+ today + "0600" + "&pageNo=1" + "&numOfRows=10"))
						.path("body").path("items").path("item");

				for (Entry<String, Object> entry : ((Map<String, Object>) OBJECT_MAPPER.convertValue(jsonNode,Map.class)).entrySet()) {
					if (entry.getKey().matches("[^0-9]*" + arg1 + "[^0-9]*"))
						weather.put(entry.getKey().replaceAll(Integer.toString(arg1), ""), entry.getValue());
				}
			}
			weathers[i] = weather;
		}
		return weathers;

	} // getWeather();

} // class WeatherAPI;
