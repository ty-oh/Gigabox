package shop.gigabox.dao;

import shop.gigabox.vo.MVO;

public interface MDao {
	public MVO selectMember(MVO mvo);
	public MVO selectMemberByIdx(int m_idx);
	public int insertMember(MVO mvo);
}
