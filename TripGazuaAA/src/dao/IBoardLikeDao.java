package dao;

import java.util.HashMap;

public interface IBoardLikeDao {
	
	public int likeCount(int num);
	
	public void boardLike(HashMap<String, Object> params);
	
}
