package shop.gigabox.service;

import java.util.List;

import shop.gigabox.dao.TDao;
import shop.gigabox.dao.TDaoImpl;
import shop.gigabox.vo.TVO;

public class TServiceImpl implements TService {
	TDao tdao = TDaoImpl.getInstance();
	
	@Override
	public List<TVO> getTicketListByIdx(int m_idx) {
		return tdao.selectTicketByIdx(m_idx);
	}
	
	@Override
	public int confirmBooking(TVO tvo) {
		return tdao.insertTicket(tvo);
	}
}
