package dao;

import model.Trip_Board;

public interface Trip_BoardDao {
	public int insertTripBoard(Trip_Board trip_board);
	public int updateTripBoard(Trip_Board trip_board);
	public int deleteTripBoard(int trip_board_num);
	public int selectOneTripBoard(int trip_board_num);
	public int selectAllTripBoard();
}
