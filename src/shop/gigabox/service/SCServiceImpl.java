package shop.gigabox.service;

import shop.gigabox.dao.SCDao;
import shop.gigabox.dao.SCDaoImpl;
import shop.gigabox.vo.SCVO;

public class SCServiceImpl implements SCService {
	SCDao scdao = SCDaoImpl.getInstance();
	
	@Override
	public int insertSchedule(SCVO scvo) {
		return scdao.insertSchedule(scvo);
	}
}
