package dao;

import java.util.HashMap;

public interface IBoardLikeDao {
	
	public void likeInsert(HashMap<String, Object> params);
	
	public void likeDelete(HashMap<String, Object> params);
	
}
