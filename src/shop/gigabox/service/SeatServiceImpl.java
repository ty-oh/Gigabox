package shop.gigabox.service;

import shop.gigabox.dao.SeatDao;
import shop.gigabox.dao.SeatDaoImpl;
import shop.gigabox.vo.SEATVO;

public class SeatServiceImpl implements SeatService {
	SeatDao seatdao = SeatDaoImpl.getInstance();
	
	@Override
	public int insert(SEATVO seatvo) {
		return seatdao.insert(seatvo);
	}
}
