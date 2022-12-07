package shop.gigabox.vo;

public class SEATVO {
	private int th_idx;
	private String th_row;
	private String th_col;

	public SEATVO() {}
	public SEATVO(int th_idx, String th_row, String th_col) {
		this.th_idx = th_idx;
		this.th_row = th_row;
		this.th_col = th_col;
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
	public String getTh_col() {
		return th_col;
	}
	public void setTh_col(String th_col) {
		this.th_col = th_col;
	}
}
