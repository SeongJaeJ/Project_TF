package dao;

import model.Daily_Trip;

public interface Daily_TripDao {
	public int insertDailyTrip(Daily_Trip daily_trip);
	public int updateDailyTrip(Daily_Trip daily_trip);
	public int deleteOneDailyTrip(int daily_trip_index);
	public int deleteAllDailyTrip(int trip_board_num);
	public int selectOneDailyTrip(int daily_trip_index);
	public int selectAllDailyTrip(int trip_board_num);
}
