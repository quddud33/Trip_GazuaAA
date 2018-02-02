package dao;

import java.util.HashMap;
import java.util.List;

public interface IBoardDao {

	//글 쓰기
	public void insertBoard(HashMap<String, Object> params);
	
	//글 수정
	public void updateBoard(HashMap<String, Object> params);
	
	//글 삭제
	public void deleteBoard(int num);
	
	//글 하나 보기
	public HashMap<String, Object> selectOne(int num);
	
	//글 전체 보기
	public List<HashMap<String, Object>> selectAll();
	
	//조회수
	public void readCountPlus(int num);
	
	//검색
	public List<HashMap<String, Object>> searchBoard(HashMap<String, Object> params);
	
	//글 개수
	public void count();
	
	//검색 결과 개수
	public void searchCount(HashMap<String, Object> params);
	
}
