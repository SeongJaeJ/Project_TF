package model;

import java.util.Date;

public class Trip_Board {
	private int trip_board_num;
	private String trip_board_title;
	private String member_id;
	private String member_nick;
	private String trip_board_memo;
	private String trip_board_period;
	private int trip_board_recruit;
	private int trip_board_hits;
	private int trip_board_recommend;
	private int trip_board_bool;
	private Date trip_board_writedate;
	
	public Trip_Board() {
		
	}

	public Trip_Board(int trip_board_num, String trip_board_title, String member_id, String member_nick,
			String trip_board_memo, String trip_board_period, int trip_board_recruit, int trip_board_hits,
			int trip_board_recommend, int trip_board_bool, Date trip_board_writedate) {
		super();
		this.trip_board_num = trip_board_num;
		this.trip_board_title = trip_board_title;
		this.member_id = member_id;
		this.member_nick = member_nick;
		this.trip_board_memo = trip_board_memo;
		this.trip_board_period = trip_board_period;
		this.trip_board_recruit = trip_board_recruit;
		this.trip_board_hits = trip_board_hits;
		this.trip_board_recommend = trip_board_recommend;
		this.trip_board_bool = trip_board_bool;
		this.trip_board_writedate = trip_board_writedate;
	}



	public int getTrip_board_num() {
		return trip_board_num;
	}

	public String getTrip_board_title() {
		return trip_board_title;
	}

	public String getMember_id() {
		return member_id;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public String getTrip_board_memo() {
		return trip_board_memo;
	}

	public String getTrip_board_period() {
		return trip_board_period;
	}

	public int getTrip_board_recruit() {
		return trip_board_recruit;
	}

	public int getTrip_board_hits() {
		return trip_board_hits;
	}

	public int getTrip_board_recommend() {
		return trip_board_recommend;
	}

	public int getTrip_board_bool() {
		return trip_board_bool;
	}

	public Date getTrip_board_writedate() {
		return trip_board_writedate;
	}

	public void setTrip_board_num(int trip_board_num) {
		this.trip_board_num = trip_board_num;
	}

	public void setTrip_board_title(String trip_board_title) {
		this.trip_board_title = trip_board_title;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public void setTrip_board_memo(String trip_board_memo) {
		this.trip_board_memo = trip_board_memo;
	}

	public void setTrip_board_period(String trip_board_period) {
		this.trip_board_period = trip_board_period;
	}

	public void setTrip_board_recruit(int trip_board_recruit) {
		this.trip_board_recruit = trip_board_recruit;
	}

	public void setTrip_board_hits(int trip_board_hits) {
		this.trip_board_hits = trip_board_hits;
	}

	public void setTrip_board_recommend(int trip_board_recommend) {
		this.trip_board_recommend = trip_board_recommend;
	}

	public void setTrip_board_bool(int trip_board_bool) {
		this.trip_board_bool = trip_board_bool;
	}

	public void setTrip_board_writedate(Date trip_board_writedate) {
		this.trip_board_writedate = trip_board_writedate;
	}

	@Override
	public String toString() {
		return "Trip_Board [trip_board_num=" + trip_board_num + ", trip_board_title=" + trip_board_title
				+ ", member_id=" + member_id + ", member_nick=" + member_nick + ", trip_board_memo=" + trip_board_memo
				+ ", trip_board_period=" + trip_board_period + ", trip_board_recruit=" + trip_board_recruit
				+ ", trip_board_hits=" + trip_board_hits + ", trip_board_recommend=" + trip_board_recommend
				+ ", trip_board_bool=" + trip_board_bool + ", trip_board_writedate=" + trip_board_writedate + "]";
	}
	
	
}
