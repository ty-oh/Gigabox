package shop.gigabox.service;

import shop.gigabox.dao.TDao;
import shop.gigabox.dao.TDaoImpl;
import shop.gigabox.vo.TVO;

public class TServiceImpl implements TService {
	TDao tdao = TDaoImpl.getInstance();
	
	@Override
	public int confirmBooking(TVO tvo) {
		return tdao.insertTicket(tvo);
	}
}
