package shop.gigabox.dao;

import java.util.List;

import shop.gigabox.vo.SEATVO;

public interface SeatDao {
	public int insert(SEATVO seatvo);
	public List<SEATVO> selectSeatList(int th_idx);
}