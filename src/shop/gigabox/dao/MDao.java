package shop.gigabox.dao;

import shop.gigabox.vo.MVO;

public interface MDao {
	public MVO selectMember(MVO mvo);
	public int insertMember(MVO mvo);
}
