package shop.gigabox.dao;

import org.apache.ibatis.session.SqlSession;

import shop.gigabox.mybatis.config.DBService;
import shop.gigabox.vo.MVO;

public class MDaoImpl implements MDao{
	private static MDaoImpl instance = null;
	private MDaoImpl() {};
	public static MDaoImpl getInstance() {
		if (instance == null) {
			instance = new MDaoImpl();
		}
		return instance;
	}
	
	private static SqlSession sqlSession = null;
	private static SqlSession getSqlSession() {
		if (sqlSession== null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	@Override
	public MVO selectMember(MVO mvo) {
		return getSqlSession().selectOne("select_member", mvo);
	}
	
	@Override
	public MVO selectMemberByIdx(int m_idx) {
		return getSqlSession().selectOne("select_member_by_idx", m_idx);
	}
	
	@Override
	public int selectCountById(String id_value) {
		return getSqlSession().selectOne("select_count_by_id", id_value);
	}
	
	@Override
	public int insertMember(MVO mvo) {
		int result = getSqlSession().insert("insert_member", mvo);
		if (result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
}
