package shop.gigabox.vo;

import java.sql.Date;

public class MVO {
	private int m_idx;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_isadmin;
	private Date m_reg_date;
	
	public MVO() {}
	public MVO(int m_idx, String m_id, String m_pw, String m_name, String m_phone, String m_email, String m_isadmin,
			Date m_reg_date) {
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_isadmin = m_isadmin;
		this.m_reg_date = m_reg_date;
	}
	
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_isadmin() {
		return m_isadmin;
	}
	public void setM_isadmin(String m_isadmin) {
		this.m_isadmin = m_isadmin;
	}
	public Date getM_reg_date() {
		return m_reg_date;
	}
	public void setM_reg_date(Date m_reg_date) {
		this.m_reg_date = m_reg_date;
	}
}