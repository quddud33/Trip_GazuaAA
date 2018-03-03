package dao;

import java.util.HashMap;
import java.util.List;

public interface ICommentDao {
	
	public void insertComment(HashMap<String, Object> params);
	
	public void updateComment(HashMap<String, Object> params);
	
	public void deleteComment(int commentNum);
	
	public HashMap<String, Object> selectOne(int commentNum);
	
	public List<HashMap<String, Object>> selectList(int num);
	
	public int commentCount(int num);
	
	
}
