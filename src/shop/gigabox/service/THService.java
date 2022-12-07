package shop.gigabox.service;

import shop.gigabox.vo.THVO;

public interface THService {
	public THVO selectByName(String th_name);
	public int insert(THVO thvo);
}
