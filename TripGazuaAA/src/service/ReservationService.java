package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IReservationDao;

@Service
public class ReservationService {

	@Autowired
	IReservationDao resDao;
	
	//======================숙박업소============================
	
	public void insertReservation(HashMap<String, String> params) {
		resDao.insertReservation(params);
	}
	
	public List<HashMap<String, String>> selectReservation(String userID) {
		return resDao.selectReservation(userID);
	}
	
	public void deleteReservation(HashMap<String, String> params) {
		resDao.deleteReservation(params);
	}
	
	//=======================축제================================
	
	public void insertFestval(HashMap<String, String> params) {
		resDao.insertFestval(params);
	}

	public List<HashMap<String, String>> selectFestval(String userID) {
		return resDao.selectFestval(userID);
	}

	public void deleteFestval(HashMap<String, String> params) {
		resDao.deleteFestval(params);
	}
	
	//=======================음식점==============================

	public void insertRestaurant(HashMap<String, String> params) {
		resDao.insertRestaurant(params);
	}

	public List<HashMap<String, String>> selectRestaurant(String userID) {
		return resDao.selectRestaurant(userID);
	}

	public void deleteRestaurant(HashMap<String, String> params) {
		resDao.deleteRestaurant(params);
	}
	
	
	
}
