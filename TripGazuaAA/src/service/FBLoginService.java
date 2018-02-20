package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ILoginDao;

@Service
public class FBLoginService {
	
	@Autowired
	private ILoginDao lDao;
	
	public void createFBUser(HashMap<String, String> params) {
		lDao.createFBUser(params);
	}
}
