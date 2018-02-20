package dao;

import java.util.HashMap;

public interface ILoginDao {
	
	public HashMap<String, String> login(String userID);
	
	public void createUser(HashMap<String, String> params);
	
	public int checkID(String userID);
	
	public void createNaverUser(HashMap<String, String> params);
	
	public void createGoogleUser(HashMap<String, String> params);
	
	public void createFBUser(HashMap<String, String> params);

}
