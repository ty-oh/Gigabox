package shop.gigabox.service;

import shop.gigabox.dao.THDao;
import shop.gigabox.dao.THDaoImpl;
import shop.gigabox.vo.THVO;

public class THServiceImpl implements THService{
	THDao thdao = THDaoImpl.getInstance();
	
	@Override
	public THVO selectByName(String th_name) {
		return thdao.selectTheater(th_name);
	}

	public THVO selectByIdx(int th_idx) {
		return thdao.selectTheater(th_idx);
	}
	
	@Override
	public int insert(THVO thvo) {
		return thdao.insertTheater(thvo);
	}
}
