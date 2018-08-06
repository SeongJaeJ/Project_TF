package dao;

import model.Road_Finder;

public interface Road_FinderDao {
	public int insertRoadFinder(Road_Finder road_finder);
	public int updateRoadFinder(Road_Finder road_finder);
	public int deleteOneRoadFinder(int road_finder_index);
	public int deleteAllRoadFinder(int daily_trip_index);
	public int selectOneRoadFinder(int road_finder_index);
	public int selectAllRoadFinder(int daily_trip_index);
}
