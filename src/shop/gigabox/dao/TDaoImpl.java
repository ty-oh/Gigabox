package shop.gigabox.dao;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.TVO;

public class TDaoImpl implements TDao {
	private static TDaoImpl instance = null;
	private TDaoImpl() {}
	public static TDaoImpl getInstance() {
		if (instance == null) {
			instance = new TDaoImpl();
		}
		return instance;
	}
	
	private static SqlSession sqlSession = null;
	public synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	@Override
	public int insertTicket(TVO tvo) {
		int result = getSqlSession().insert("insert_ticket", tvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
