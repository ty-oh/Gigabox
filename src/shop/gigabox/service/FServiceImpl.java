package shop.gigabox.service;

import shop.gigabox.dao.FDao;
import shop.gigabox.dao.FDaoImpl;
import shop.gigabox.vo.FVO;

public class FServiceImpl implements FService{
	FDao fdao = FDaoImpl.getInstance();
	
	@Override
	public int checkIsClicked(FVO fvo) {
		return fdao.selectCountFVO(fvo);
	}
	
	@Override
	public int countFavorite(int mv_idx) {
		return fdao.selectCountByIdx(mv_idx);
	}
	
	@Override
	public int addFavorite(FVO fvo) {
		return fdao.insertFVO(fvo);
	}
	
	@Override
	public int removeFavorite(FVO fvo) {
		return fdao.deleteFVO(fvo);
	}
}
