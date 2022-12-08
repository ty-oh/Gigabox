package shop.gigabox.service;

import shop.gigabox.dao.RDao;
import shop.gigabox.dao.RDaoImpl;
import shop.gigabox.vo.RVO;

public class RServiceImpl implements RService {
	RDao rdao = RDaoImpl.getInstance();

	@Override
	public int insertReview(RVO rvo) {
		return rdao.insertReview(rvo);
	}
}
