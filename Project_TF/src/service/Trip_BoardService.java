package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Daily_TripDao;
import dao.Road_FinderDao;
import dao.Trip_BoardDao;
import model.Daily_Trip;
import model.Road_Finder;
import model.Trip_Board;

@Service
public class Trip_BoardService {
	
	@Autowired
	private Trip_BoardDao trip_boardDao;
	@Autowired
	private Daily_TripDao daily_tripDao;
	@Autowired
	private Road_FinderDao road_finderDao;
	
	public void writeTripBoard(Trip_Board trip_board, List<Daily_Trip> daily_tripList, List<Road_Finder> road_finderList) {
//		System.out.println(trip_board);
//		System.out.println(daily_tripList);
//		System.out.println(road_finderList);
		
		trip_boardDao.insertTripBoard(trip_board);
		System.out.println("얘는 됬음");
		System.out.println(trip_board.getTrip_board_num());
		for(Daily_Trip daily_trip : daily_tripList) {
			daily_trip.setTrip_board_num(trip_board.getTrip_board_num());
			daily_tripDao.insertDailyTrip(daily_trip);
			for(Road_Finder road_finder : road_finderList) {
				road_finder.setDaily_trip_index(daily_trip.getDaily_trip_index());
				road_finderDao.insertRoadFinder(road_finder);
			}
		}
	}
}
