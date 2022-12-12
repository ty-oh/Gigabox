package shop.gigabox.dao;

import shop.gigabox.vo.FVO;

public interface FDao {
	public int selectCountFVO(FVO fvo);
	public int selectCountByIdx(int mv_idx);
	public int insertFVO(FVO fvo);
	public int deleteFVO(FVO fvo);
}
