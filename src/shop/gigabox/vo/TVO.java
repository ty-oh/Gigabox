package shop.gigabox.vo;

public class TVO {
	private int t_idx;
	private int sc_idx;
	private int m_idx;

	public TVO() {}
	public TVO(int t_idx, int sc_idx, int m_idx) {
		this.t_idx = t_idx;
		this.sc_idx = sc_idx;
		this.m_idx = m_idx;
	}
	
	public int getT_idx() {
		return t_idx;
	}
	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}
	public int getSc_idx() {
		return sc_idx;
	}
	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
}
