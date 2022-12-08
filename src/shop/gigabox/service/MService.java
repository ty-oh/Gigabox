package shop.gigabox.service;

import shop.gigabox.vo.MVO;

public interface MService {
	public MVO login(MVO mvo);
	public MVO getMemberByIdx(int m_idx);
	public int joinMember(MVO mvo);
}
