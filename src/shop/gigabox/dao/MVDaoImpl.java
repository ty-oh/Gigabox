package shop.gigabox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.MVVO;

public class MVDaoImpl implements MVDao{
	private static MVDaoImpl instance = null;
	private MVDaoImpl() {}
	public static MVDaoImpl getInstance() {
		if (instance == null) {
			instance = new MVDaoImpl();
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
	public List<MVVO> getRecentListFour() {
		return getSqlSession().selectList("select_recent_four");
	}
	
	@Override
	public MVVO selectMovie(int mv_idx) {
		return getSqlSession().selectOne("select_movie", mv_idx);
	}
	
	@Override
	public List<MVVO> selectMovieList() {
		return getSqlSession().selectList("select_movie_list");
	}
	
	@Override
	public List<MVVO> selectMovieListInSchedule() {
		return getSqlSession().selectList("select_movie_list_in_schedule");
	}
	
	@Override
	public int insert(MVVO mvvo) {
		int result = getSqlSession().insert("insert_mv", mvvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}