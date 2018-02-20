package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import constant.Constant;
import dao.ILoginDao;

@Service
public class NaverMemberService {
    @Autowired
    private ILoginDao lDao;
	
	public HashMap<String, Object> naverLogin(String urlString) throws Exception {
		URL url = new URL(urlString);
		URLConnection urlConn = url.openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		
		String data = "";
		String msg = "";

		while ((msg = br.readLine()) != null) {
			data += msg;
		}
		
		JSONParser parser = new JSONParser();
		
		Object object = parser.parse(data);
		JSONObject jsonObject = (JSONObject) object;
		
		String accessToken = (String) jsonObject.get("access_token");
		
		String authorization = "Bearer " + accessToken;

		url = new URL("https://openapi.naver.com/v1/nid/me");
		urlConn = url.openConnection();

		urlConn.setRequestProperty("Authorization", authorization);
		
		br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		
		data = "";
		
		while ((msg = br.readLine()) != null) {
			data += msg;
		}
		
		HashMap<String, Object> params = new HashMap<>();
		
		object = parser.parse(data);
		jsonObject = (JSONObject) object;
		
		String nickname = (String) ((JSONObject)jsonObject.get("response")).get("nickname");
		String id = (String) ((JSONObject)jsonObject.get("response")).get("id");
		
		params.put(Constant.Member.NAME, nickname);
		params.put(Constant.Member.USERID, id);
		
		return params;
	}
	
	public void createNaverUser(HashMap<String, String> params) {
		lDao.createNaverUser(params);
	}
	
}
