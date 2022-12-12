package shop.gigabox.dao;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.FVO;

public class FDaoImpl implements FDao {
	private static FDaoImpl instance = null;
	private FDaoImpl() {}
	public static FDaoImpl getInstance() {
		if(instance == null) {
			instance = new FDaoImpl();
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
	public int selectCountFVO(FVO fvo) {
		return getSqlSession().selectOne("select_count_fvo", fvo);
	}
	
	@Override
	public int selectCountByIdx(int mv_idx) {
		return getSqlSession().selectOne("select_count_by_idx", mv_idx);
	}
	
	@Override
	public int insertFVO(FVO fvo) {
		int result = getSqlSession().insert("insert_fvo", fvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
	@Override
	public int deleteFVO(FVO fvo) {
		int result = getSqlSession().delete("delete_fvo", fvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
