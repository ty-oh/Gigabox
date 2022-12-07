package shop.gigabox.dao;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.THVO;

public class THDaoImpl implements THDao {
	private static THDaoImpl instance = null;
	private THDaoImpl() {}
	public static THDaoImpl getInstance() {
		if (instance == null) {
			instance = new THDaoImpl();
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
	public THVO selectTheater(String th_name) {
		return getSqlSession().selectOne("select_theater_by_name", th_name);
	}
	
	@Override
	public THVO selectTheater(int th_idx) {
		return getSqlSession().selectOne("select_theater_by_idx", th_idx);
	}
	
	@Override
	public int insertTheater(THVO thvo) {
		int result = getSqlSession().insert("insert_theater", thvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
