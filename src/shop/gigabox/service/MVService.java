package shop.gigabox.service;

import java.util.List;

import shop.gigabox.vo.MVVO;

public interface MVService {
	public int insert(MVVO mvvo);
	public List<MVVO> getRecentListFour();
}
