package shop.gigabox.dao;

import java.util.List;
import java.util.Map;

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
	public List<SCVO> selectByIdxMap(Map<String, Integer> idxMap) {
		return getSqlSession().selectList("select_schedule_by_idx_map", idxMap);
	}
	
	@Override
	public List<SCVO> selectByDateIdx(SCVO scvo) {
		return getSqlSession().selectList("select_schedule_by_date_idx", scvo);
	}
	
	@Override
	public SCVO selectSchedule(SCVO scvo) {
		return getSqlSession().selectOne("select_schedule", scvo);
	}
	
	@Override
	public int insertSchedule(SCVO scvo) {
		int result = getSqlSession().insert("insert_schedule", scvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
	@Override
	public int updateScheduleBooking(int sc_idx) {
		int result = getSqlSession().update("update_schedule_booking", sc_idx);
		if (result > 0) {
			getSqlSession().commit();
		}
		return 0;
	}
}
