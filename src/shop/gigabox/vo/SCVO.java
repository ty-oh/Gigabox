package shop.gigabox.vo;

public class SCVO {
	private int sc_idx;
	private String screen_date;
	private int th_idx;
	private String th_row;
	private int th_col;
	private int mv_idx;
	
	public SCVO() {}
	public SCVO(int sc_idx, String screen_date, int th_idx, String th_row, int th_col, int mv_idx) {
		this.sc_idx = sc_idx;
		this.screen_date = screen_date;
		this.th_idx = th_idx;
		this.th_row = th_row;
		this.th_col = th_col;
		this.mv_idx = mv_idx;
	}
	
	public int getSc_idx() {
		return sc_idx;
	}
	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}
	public String getScreen_date() {
		return screen_date;
	}
	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}
	public int getTh_idx() {
		return th_idx;
	}
	public void setTh_idx(int th_idx) {
		this.th_idx = th_idx;
	}
	public String getTh_row() {
		return th_row;
	}
	public void setTh_row(String th_row) {
		this.th_row = th_row;
	}
	public int getTh_col() {
		return th_col;
	}
	public void setTh_col(int th_col) {
		this.th_col = th_col;
	}
	public int getMv_idx() {
		return mv_idx;
	}
	public void setMv_idx(int mv_idx) {
		this.mv_idx = mv_idx;
	}
}
