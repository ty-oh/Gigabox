package shop.gigabox.dao;

import java.util.List;

import shop.gigabox.vo.RVO;

public interface RDao {
	public List<RVO> selectReviewListByIdx(int m_idx);
	public List<RVO> selectReviewListByMvIdx(int mv_idx);
	public RVO selectReviewByIdx(int r_idx);
	public int selectCountReviewByIdx(RVO rvo);
	public int selectAvgReviewScoreByIdx(int mv_idx);
	public int insertReview(RVO rvo);
	public int updateReview(RVO rvo);
	public int deleteReview(int r_idx);
}
