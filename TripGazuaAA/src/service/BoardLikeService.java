package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardLikeDao;

@Service
public class BoardLikeService {

	@Autowired
	private IBoardLikeDao dao;
	
	public void likeInsert(HashMap<String, Object> params) {
		dao.likeInsert(params);
	}
	
	public void likeDelete(HashMap<String, Object> params) {
		dao.likeDelete(params);
	}
	public String likeCheck(HashMap<String, Object> params) {
		return dao.likeCheck(params);
	}
}
