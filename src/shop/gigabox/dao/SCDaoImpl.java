package shop.gigabox.dao;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.SCVO;

public class SCDaoImpl implements SCDao{
	private static SCDaoImpl instance = null;
	private SCDaoImpl() {}
	public static SCDaoImpl getInstance() {
		if (instance == null) {
			instance = new SCDaoImpl();
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
	public int insertSchedule(SCVO scvo) {
		int result = getSqlSession().insert("insert_schedule", scvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
}
