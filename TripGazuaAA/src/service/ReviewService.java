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
	public int deleteReview(int num) {
		return rDao.deleteReview(num);
	}
	public int updateReview(HashMap<String, String>params) {
		return rDao.updateReview(params);
	}
	public List<HashMap<String, String>> reivewList(String contentID){
		return rDao.reviewList(contentID);
	}
}
