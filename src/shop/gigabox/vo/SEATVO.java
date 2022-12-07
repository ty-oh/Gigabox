package shop.gigabox.vo;

public class SEATVO {
	private int th_idx;
	private String th_row;
	private int th_col;
	private int price;
	
	public SEATVO() {}
	public SEATVO(int th_idx, String th_row, int th_col, int price) {
		this.th_idx = th_idx;
		this.th_row = th_row;
		this.th_col = th_col;
		this.price = price;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
}
