package shop.gigabox.service;

import java.util.List;

import shop.gigabox.vo.SEATVO;

public interface SeatService {
	public int insert(SEATVO seatvo);
	public List<SEATVO> getSeatList(int th_idx);
}
