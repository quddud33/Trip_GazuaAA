package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IReservationDao;

@Service
public class ReservationService {

	@Autowired
	IReservationDao resDao;
	
	public void insertReservation(HashMap<String, String> params) {
		resDao.insertReservation(params);
	}
	
}
