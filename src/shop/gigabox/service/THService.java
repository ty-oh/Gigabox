package shop.gigabox.service;

import java.util.List;

import shop.gigabox.vo.THVO;

public interface THService {
	public THVO selectByName(String th_name);
	public THVO getTheaterByIdx(int th_idx);
	public int insert(THVO thvo);
	public List<THVO> getTheaterList();
	public List<THVO> getTheaterByScheduledMV(int mv_idx);
}
