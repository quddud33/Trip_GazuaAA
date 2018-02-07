package dao;

import java.util.HashMap;
import java.util.List;

public interface IReservationDao {

	//=========================숙박업소==============================
	
	public void insertReservation(HashMap<String, String> params);
	
	public List<HashMap<String, String>> selectReservation(String userID);
	
	public void deleteReservation(HashMap<String, String> params);
	
	//=========================축제==================================
	
	public void insertFestval(HashMap<String, String> params);
	
	public List<HashMap<String, String>> selectFestval(String userID);
	
	public void deleteFestval(HashMap<String, String> params);
	
	//==========================음식점================================
	
	public void insertRestaurant(HashMap<String, String> params);
	
	public List<HashMap<String, String>> selectRestaurant(String userID);
	
	public void deleteRestaurant(HashMap<String, String> params);
	
	
	
}
