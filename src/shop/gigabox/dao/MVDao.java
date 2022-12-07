package shop.gigabox.dao;

import java.util.List;

import shop.gigabox.vo.MVVO;

public interface MVDao {
	public int insert(MVVO mvvo);
	public List<MVVO> getRecentListFour();
	public MVVO selectMovie(int mv_idx);
	public List<MVVO> selectMovieList();
	public List<MVVO> selectMovieListInSchedule();
}
