package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardDao;

@Service
public class BoardService {

	@Autowired
	private IBoardDao bDao;
	
	//전체 글 출력
	public List<HashMap<String, Object>> selectAll() {
		return bDao.selectAll();
	}
	
	//글 쓰기
	public void insertBoard(HashMap<String, Object> params) {
		bDao.insertBoard(params);
	}
	
	//게시글 보기
	public HashMap<String, Object> selectOne(int num) {
		return bDao.selectOne(num);
	}
	
	//글 삭제
	public void deleteBoard(int num) {
		bDao.deleteBoard(num);
	}
	
	//글 수정
	public void updateBoard(HashMap<String, Object> params) {
		bDao.updateBoard(params);
	}
}
