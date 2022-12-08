package shop.gigabox.service;

import java.util.List;

import shop.gigabox.dao.MVDao;
import shop.gigabox.dao.MVDaoImpl;
import shop.gigabox.vo.MVVO;

public class MVServiceImpl implements MVService {
	MVDao mvdao = MVDaoImpl.getInstance();
	
	@Override
	public int insert(MVVO mvvo) {
		return mvdao.insert(mvvo);
	}
	
	@Override
	public List<MVVO> getRecentListFour() {
		return mvdao.getRecentListFour();
	}
	
	@Override
	public List<MVVO> getScreeningMV() {
		return mvdao.selectMovieListInSchedule();
	}
	
	@Override
	public MVVO getMovieInfo(int mv_idx) {
		return mvdao.selectMovie(mv_idx);
	}
	
	@Override
	public List<MVVO> getMovieList() {
		return mvdao.selectMovieList();
	}
}
