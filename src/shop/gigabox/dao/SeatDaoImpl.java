package shop.gigabox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.SEATVO;

public class SeatDaoImpl implements SeatDao{
	private static SeatDaoImpl instance = null;
	private SeatDaoImpl() {}
	public static SeatDaoImpl getInstance() {
		if (instance == null) {
			instance = new SeatDaoImpl();
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
	public List<SEATVO> selectSeatList(int th_idx) {
		return getSqlSession().selectList("select_seat_by_th_idx", th_idx);
	}
	
	@Override
	public int insert(SEATVO seatvo) {
		int result = getSqlSession().insert("insert_seat", seatvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return 0;
	}
}
