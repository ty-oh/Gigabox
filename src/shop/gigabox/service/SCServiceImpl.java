package shop.gigabox.service;

import java.util.List;
import java.util.Map;

import shop.gigabox.dao.SCDao;
import shop.gigabox.dao.SCDaoImpl;
import shop.gigabox.vo.SCVO;

public class SCServiceImpl implements SCService {
	SCDao scdao = SCDaoImpl.getInstance();
	
	@Override
	public List<SCVO> getScheduleByThMvIdx(Map<String, Integer> idxMap) {
		return scdao.selectByIdxMap(idxMap);
	}
	
	@Override
	public List<SCVO> getScheduleByIdxDate(SCVO scvo) {
		return scdao.selectByDateIdx(scvo);
	}
	
	@Override
	public SCVO selectSchedule(SCVO scvo) {
		return scdao.selectSchedule(scvo);
	}
	
	@Override
	public SCVO getSchedultByIdx(int sc_idx) {
		return scdao.selectScheduleByIdx(sc_idx);
	}
	
	@Override
	public int bookingSchedule(int sc_idx) {
		return scdao.updateScheduleBooking(sc_idx);
	}
	
	@Override
	public int insertSchedule(SCVO scvo) {
		return scdao.insertSchedule(scvo);
	}
	
	@Override
	public int cancelBooking(int sc_idx) {
		return scdao.updateScheduleUnbooking(sc_idx);
	}
}
