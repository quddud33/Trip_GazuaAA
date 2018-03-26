package dao;


import java.util.HashMap;
import java.util.List;

public interface IReviewDao {

	public List<HashMap<String, String>> topSelectFestival();

	public List<HashMap<String, String>> topSelectCountry();

	public List<HashMap<String, String>> topSelectRestaurant();
	
	

	public int insertReview(HashMap<String, String> params);
	
	public int deleteReview(HashMap<String, String>params);
	
	public int updateReview(HashMap<String, String> params);
	
	
//	public List<HashMap<String, String>> reviewList(HashMap<String, String> params);
	public List<HashMap<String, String>> reviewList(String contentID);

	public List<HashMap<String, String>> reviewNum(String num);
	
	
	public int likeSum(String num);

	public int likeMinus(String num);
	
	public int likeInsert(HashMap<String, String> params);
	
	
	public int userLikeReviewDelete(HashMap<String, String> params);
	
	public int userLikeReviewInsert(HashMap<String, String>params);
	
	public List<HashMap<String, String>> userReviewLikeCheck(String userID);
	
	public List<HashMap<String, String>> myPageReviewSelect(String userID);
	
}
