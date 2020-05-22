package com.ktds.devpro.model.vo;

public class MemberVO {
	
	private int CustIdx;
	private String CustNm;
	private String CustId;
	private String CustPwd;
	private String CustPhone;
	private String CustEmail;
	
	public MemberVO(int custIdx, String custNm, String custId, String custPwd, String custPhone, String custEmail) {
		super();
		CustIdx = custIdx;
		CustNm = custNm;
		CustId = custId;
		CustPwd = custPwd;
		CustPhone = custPhone;
		CustEmail = custEmail;
	}
	
	@Override
	public String toString() {
		return "MemberVO [CustIdx=" + CustIdx + ", CustNm=" + CustNm + ", CustId=" + CustId + ", CustPwd=" + CustPwd
				+ ", CustPhone=" + CustPhone + ", CustEmail=" + CustEmail + "]";
	}
	public int getCustIdx() {
		return CustIdx;
	}
	public void setCustIdx(int custIdx) {
		CustIdx = custIdx;
	}
	public String getCustNm() {
		return CustNm;
	}
	public void setCustNm(String custNm) {
		CustNm = custNm;
	}
	public String getCustId() {
		return CustId;
	}
	public void setCustId(String custId) {
		CustId = custId;
	}
	public String getCustPwd() {
		return CustPwd;
	}
	public void setCustPwd(String custPwd) {
		CustPwd = custPwd;
	}
	public String getCustPhone() {
		return CustPhone;
	}
	public void setCustPhone(String custPhone) {
		CustPhone = custPhone;
	}
	public String getCustEmail() {
		return CustEmail;
	}
	public void setCustEmail(String custEmail) {
		CustEmail = custEmail;
	}
}
