package shop.gigabox.dao;

import java.util.List;
import java.util.Map;

import shop.gigabox.vo.SCVO;

public interface SCDao {
	public List<SCVO> selectByIdxMap(Map<String, Integer> idxMap);
	public List<SCVO> selectByDateIdx(SCVO scvo);
	public SCVO selectSchedule(SCVO scvo);
	public SCVO selectScheduleByIdx(int sc_idx);
	public int insertSchedule(SCVO scvo);
	public int updateScheduleBooking(int sc_idx);
}
