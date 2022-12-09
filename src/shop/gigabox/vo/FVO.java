package shop.gigabox.vo;

public class FVO {
	private int mv_idx;
	private int m_idx;

	public FVO() {}
	public FVO(int mv_idx, int m_idx) {
		this.mv_idx = mv_idx;
		this.m_idx = m_idx;
	}
	
	public int getMv_idx() {
		return mv_idx;
	}
	public void setMv_idx(int mv_idx) {
		this.mv_idx = mv_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
}
