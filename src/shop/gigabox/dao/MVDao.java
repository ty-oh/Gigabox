package shop.gigabox.dao;

import java.util.List;

import shop.gigabox.vo.MVVO;

public interface MVDao {
	public int insert(MVVO mvvo);
	public List<MVVO> getRecentListFour();
}