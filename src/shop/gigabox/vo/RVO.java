package shop.gigabox.vo;

import java.sql.Date;

public class RVO {
	private int r_idx;
	private int mv_idx;
	private int m_idx;
	private String r_content;
	private int r_score;
	private Date r_reg_date;

	public RVO() {}
	public RVO(int r_idx, int mv_idx, int m_idx, String r_content, int r_score, Date r_reg_date) {
		this.r_idx = r_idx;
		this.mv_idx = mv_idx;
		this.m_idx = m_idx;
		this.r_content = r_content;
		this.r_score = r_score;
		this.r_reg_date = r_reg_date;
	}
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
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
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public Date getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(Date r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
}
