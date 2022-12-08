package shop.gigabox.service;

import java.util.List;

import shop.gigabox.dao.THDao;
import shop.gigabox.dao.THDaoImpl;
import shop.gigabox.vo.THVO;

public class THServiceImpl implements THService{
	THDao thdao = THDaoImpl.getInstance();
	
	@Override
	public THVO selectByName(String th_name) {
		return thdao.selectTheater(th_name);
	}
	
	@Override
	public List<THVO> getTheaterList() {
		return thdao.selectAllTheater();
	}
	
	@Override
	public List<THVO> getTheaterByScheduledMV(int mv_idx) {
		return thdao.selectTheaterByScheduledMV(mv_idx);
	}
	
	@Override
	public THVO getTheaterByIdx(int th_idx) {
		return thdao.selectTheaterByIdx(th_idx);
	}
	
	@Override
	public int insert(THVO thvo) {
		return thdao.insertTheater(thvo);
	}
}
