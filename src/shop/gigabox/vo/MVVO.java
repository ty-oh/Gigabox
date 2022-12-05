package shop.gigabox.vo;

import java.sql.Date;

public class MVVO {
	private int mv_idx;
	private String title;
	private String title_eng;
	private String summary;
	private String mv_image_main;
	private String mv_image_1;
	private String mv_image_2;
	private Date reg_date;
	
	public MVVO() {}
	public MVVO(int mv_idx, String title, String title_eng, String summary, String mv_image_main, String mv_image_1,
			String mv_image_2, Date reg_date) {
		this.mv_idx = mv_idx;
		this.title = title;
		this.title_eng = title_eng;
		this.summary = summary;
		this.mv_image_main = mv_image_main;
		this.mv_image_1 = mv_image_1;
		this.mv_image_2 = mv_image_2;
		this.reg_date = reg_date;
	}
	public int getMv_idx() {
		return mv_idx;
	}
	public void setMv_idx(int mv_idx) {
		this.mv_idx = mv_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_eng() {
		return title_eng;
	}
	public void setTitle_eng(String title_eng) {
		this.title_eng = title_eng;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getMv_image_main() {
		return mv_image_main;
	}
	public void setMv_image_main(String mv_image_main) {
		this.mv_image_main = mv_image_main;
	}
	public String getMv_image_1() {
		return mv_image_1;
	}
	public void setMv_image_1(String mv_image_1) {
		this.mv_image_1 = mv_image_1;
	}
	public String getMv_image_2() {
		return mv_image_2;
	}
	public void setMv_image_2(String mv_image_2) {
		this.mv_image_2 = mv_image_2;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
