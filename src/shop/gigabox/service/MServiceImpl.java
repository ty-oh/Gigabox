package shop.gigabox.service;

import shop.gigabox.dao.MDao;
import shop.gigabox.dao.MDaoImpl;
import shop.gigabox.vo.MVO;

public class MServiceImpl implements MService {
	MDao mdao = MDaoImpl.getInstance();
	
	@Override
	public MVO login(MVO mvo) {
		return mdao.selectMember(mvo);
	}
	
	@Override
	public int joinMember(MVO mvo) {
		return mdao.insertMember(mvo);
	}
}
