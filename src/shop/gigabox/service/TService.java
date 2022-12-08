package shop.gigabox.service;

import java.util.List;

import shop.gigabox.vo.TVO;

public interface TService {
	public List<TVO> getTicketListByIdx(int m_idx);
	public int confirmBooking(TVO tvo);
}
