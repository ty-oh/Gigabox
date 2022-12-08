package shop.gigabox.vo;

public class THVO {
	private int th_idx;
	private String th_name;
	
	public THVO() {}
	public THVO(int th_idx, String th_name) {
		this.th_idx = th_idx;
		this.th_name = th_name;
	}
	
	public int getTh_idx() {
		return th_idx;
	}
	public void setTh_idx(int th_idx) {
		this.th_idx = th_idx;
	}
	public String getTh_name() {
		return th_name;
	}
	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}
}
