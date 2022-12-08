package shop.gigabox.service;

import java.util.List;

import shop.gigabox.dao.RDao;
import shop.gigabox.dao.RDaoImpl;
import shop.gigabox.vo.RVO;

public class RServiceImpl implements RService {
	RDao rdao = RDaoImpl.getInstance();

	@Override
	public List<RVO> getReviewListByUser(int m_idx) {
		return rdao.selectReviewListByIdx(m_idx);
	}
	
	@Override
	public RVO getReviewByIdx(int r_idx) {
		return rdao.selectReviewByIdx(r_idx);
	}
	
	@Override
	public int checkReview(RVO rvo) {
		return rdao.selectCountReviewByIdx(rvo);
	}
	
	@Override
	public int insertReview(RVO rvo) {
		return rdao.insertReview(rvo);
	}
	
	@Override
	public int updateReview(RVO rvo) {
		return rdao.updateReview(rvo);
	}
	
	@Override
	public int deleteReview(int r_idx) {
		return rdao.deleteReview(r_idx);
	}
}
