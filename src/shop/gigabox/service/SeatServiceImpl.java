package shop.gigabox.service;

import java.util.List;

import shop.gigabox.dao.SeatDao;
import shop.gigabox.dao.SeatDaoImpl;
import shop.gigabox.vo.SEATVO;

public class SeatServiceImpl implements SeatService {
	SeatDao seatdao = SeatDaoImpl.getInstance();
	
	@Override
	public List<SEATVO> getSeatList(int th_idx) {
		return seatdao.selectSeatList(th_idx);
	}
	
	@Override
	public int insert(SEATVO seatvo) {
		return seatdao.insert(seatvo);
	}
}
