package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ILoginDao;

@Service
public class GoogleLoginService {
	
	@Autowired
	private ILoginDao lDao;
	
	public void createGoogleUser(HashMap<String, String> params) {
		lDao.createGoogleUser(params);
	}
}
