package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardLikeDao;

@Service
public class BoardLikeService {

	@Autowired
	private IBoardLikeDao dao;
	
	//좋아요 개수
	public int likeCount(int num) {
		return dao.likeCount(num);
	}
	
	//좋아요
	public void boardLike(HashMap<String, Object> params) {
		dao.boardLike(params);
	}
	
}
