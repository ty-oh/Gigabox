package shop.gigabox.service;

import java.util.List;

import shop.gigabox.vo.RVO;

public interface RService {
	public List<RVO> getReviewListByUser(int m_idx);
	public RVO getReviewByIdx(int r_idx);
	public int checkReview(RVO rvo);
	public int insertReview(RVO rvo);
	public int updateReview(RVO rvo);
	public int deleteReview(int r_idx);
}
