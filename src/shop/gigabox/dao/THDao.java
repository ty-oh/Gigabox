package shop.gigabox.dao;

import shop.gigabox.vo.THVO;

public interface THDao {
	public int insertTheater(THVO thvo);
	public THVO selectTheater(int th_idx);
	public THVO selectTheater(String th_name);
}
