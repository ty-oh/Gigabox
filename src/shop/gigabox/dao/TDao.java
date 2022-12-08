package shop.gigabox.dao;

import java.util.List;

import shop.gigabox.vo.TVO;

public interface TDao {
	public List<TVO> selectTicketByIdx(int m_idx);
	public int insertTicket(TVO tvo);
	public int deleteTicket(int sc_idx);
}
