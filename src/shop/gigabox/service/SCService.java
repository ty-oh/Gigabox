package shop.gigabox.service;

import java.util.List;
import java.util.Map;

import shop.gigabox.vo.SCVO;

public interface SCService {
	public List<SCVO> getScheduleByThMvIdx(Map<String, Integer> idxMap); 
	public List<SCVO> getScheduleByIdxDate(SCVO scvo);
	public SCVO selectSchedule(SCVO scvo);
	public SCVO getSchedultByIdx(int sc_idx);
	public int bookingSchedule(int sc_idx);
	public int insertSchedule(SCVO scvo);
}
