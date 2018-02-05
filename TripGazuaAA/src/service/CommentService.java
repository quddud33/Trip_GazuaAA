package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ICommentDao;

@Service
public class CommentService {
	
	@Autowired
	private ICommentDao dao;
	
	//댓글 입력
	public void insertComment(HashMap<String, Object> params) {
		dao.insertComment(params);
	}
	
	//댓글 수정
	public void updateComment(HashMap<String, Object> params) {
		dao.updateComment(params);
	}
	
	//댓글 삭제
	public void deleteComment(int commentNum) {
		dao.deleteComment(commentNum);
	}
	
	//selectOne
	public HashMap<String, Object> selectOne(int commentNum) {
		return dao.selectOne(commentNum);
	}
	
	//selectAll
	public List<HashMap<String, Object>> selectAll(int num) {
		return dao.selectList(num);
	}
	
}
