package shop.gigabox.service;

import shop.gigabox.vo.FVO;

public interface FService {
	public int checkIsClicked(FVO fvo);
	public int countFavorite(int mv_idx);
	public int addFavorite(FVO fvo);
	public int removeFavorite(FVO fvo);
}
