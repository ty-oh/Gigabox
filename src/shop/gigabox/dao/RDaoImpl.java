package shop.gigabox.dao;

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
	public int insertReview(RVO rvo) {
		int result = getSqlSession().insert("insert_review", rvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result; 
	}
	
}
