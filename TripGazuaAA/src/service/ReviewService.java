package service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IReviewDao;
@Service
public class ReviewService {
	
	@Autowired
	private IReviewDao rDao;
	
	public List<HashMap<String, String>> topSelectFestival(){
		return rDao.topSelectFestival();
	}
	public List<HashMap<String, String>> topSelectCountry(){
		return rDao.topSelectCountry();
	}
	public List<HashMap<String, String>> topSelectRestaurant(){
		return rDao.topSelectRestaurant();
	}
	public int insertReview(HashMap<String, String>params){
		return rDao.insertReview(params);
	}
	public int deleteReview(HashMap<String, String>params) {
		return rDao.deleteReview(params);
	}
	public int updateReview(HashMap<String, String>params) {
		return rDao.updateReview(params);
	}
	public List<HashMap<String, String>> reviewList(HashMap<String, String> params){
		return rDao.reviewList(params);
	}
	public List<HashMap<String, String>> reviewNum(String num){
		return rDao.reviewNum(num);
	}
	public int likeSum(String num) {
		return rDao.likeSum(num);
	}
	public int likeMinus(String num) {
		return rDao.likeMinus(num);
	}
	public int likeInsert(HashMap<String, String>params){
		return rDao.likeInsert(params);
	}
	
	public int userLikeReviewInsert(HashMap<String, String> params) {
		return rDao.userLikeReviewInsert(params);
	}
	public int userlikeReviewDelete(HashMap<String, String>params) {
		return rDao.userLikeReviewDelete(params);
	}
	public List<HashMap<String, String>> userReviewLikeCheck(String userID){
		return rDao.userReviewLikeCheck(userID);
	}
	public List<HashMap<String, String>> myPageReviewSelect(String userID){
		return rDao.myPageReviewSelect(userID);
	}
	
}
