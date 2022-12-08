package shop.gigabox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.RVO;

public class RDaoImpl implements RDao {
	private static RDaoImpl instance = null;
	private RDaoImpl() {}
	public static RDaoImpl getInstance() {
		if (instance == null) {
			instance = new RDaoImpl();
		}
		return instance;
	}
	
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	@Override
	public List<RVO> selectReviewListByIdx(int m_idx) {
		return getSqlSession().selectList("select_review_list_by_idx", m_idx);
	}
	
	@Override
	public RVO selectReviewByIdx(int r_idx) {
		return getSqlSession().selectOne("select_review_by_idx", r_idx);
	}
	
	@Override
	public int selectCountReviewByIdx(RVO rvo) {
		return getSqlSession().selectOne("count_review_by_idx", rvo);
	}
	
	@Override
	public int insertReview(RVO rvo) {
		int result = getSqlSession().insert("insert_review", rvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result; 
	}
	
	@Override
	public int updateReview(RVO rvo) {
		int result = getSqlSession().update("update_review", rvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
	@Override
	public int deleteReview(int r_idx) {
		int result = getSqlSession().delete("delete_review", r_idx);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
