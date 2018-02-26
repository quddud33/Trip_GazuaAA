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
	public List<HashMap<String, Object>> selectAll(HashMap<String, Object> params) {
		return bDao.selectAll(params);
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

	//조회수
	public void views(int num) {
		bDao.views(num);
	}

	//글 개수
	public int count() {
		return bDao.count();
	}

	//검색
	public List<HashMap<String, Object>> selectSearch(HashMap<String, Object> params) {
		return bDao.selectSearch(params);
	}

	//검색 개수
	public int searchCount(HashMap<String, Object> params) {
		return bDao.searchCount(params);
	}

	//좋아요++
	public int likeCountUp(int num) {
		return bDao.likeCountUp(num);
	}
	
	//좋아요-- 
	public int likeCountDown(int num) {
		return bDao.likeCountDown(num);
	}
	
	//좋아요 개수 출력
	public int likeCount(int num) {
		return bDao.likeCount(num);
	}

}
