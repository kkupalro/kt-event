package com.ktds.devpro.model.vo;

public class EventVO {
	private int EvtIdx;
	private String EvtNm;
	private String StDate;
	private String EndDate;
	private String EvtSt;
	private String EvtFileUrl;
	private String EvtCtgId;
	private String EvtTrg;
	private String EvtPhone;
	private String EvtTrgDate;
	private String EvtCtgNm;
	
	public EventVO(int evtIdx, String evtNm, String stDate, String endDate, String evtSt, String evtFileUrl,
			String evtCtgId, String evtTrg, String evtPhone, String evtTrgDate, String evtCtgNm) {
		super();
		EvtIdx = evtIdx;
		EvtNm = evtNm;
		StDate = stDate;
		EndDate = endDate;
		EvtSt = evtSt;
		EvtFileUrl = evtFileUrl;
		EvtCtgId = evtCtgId;
		EvtTrg = evtTrg;
		EvtPhone = evtPhone;
		EvtTrgDate = evtTrgDate;
		EvtCtgNm = evtCtgNm;
	}
	
	public EventVO() {
		
	}

	public int getEvtIdx() {
		return EvtIdx;
	}

	public void setEvtIdx(int evtIdx) {
		EvtIdx = evtIdx;
	}

	public String getEvtNm() {
		return EvtNm;
	}

	public void setEvtNm(String evtNm) {
		EvtNm = evtNm;
	}

	public String getStDate() {
		return StDate;
	}

	public void setStDate(String stDate) {
		StDate = stDate;
	}

	public String getEndDate() {
		return EndDate;
	}

	public void setEndDate(String endDate) {
		EndDate = endDate;
	}

	public String getEvtSt() {
		return EvtSt;
	}

	public void setEvtSt(String evtSt) {
		EvtSt = evtSt;
	}

	public String getEvtFileUrl() {
		return EvtFileUrl;
	}

	public void setEvtFileUrl(String evtFileUrl) {
		EvtFileUrl = evtFileUrl;
	}

	public String getEvtCtgId() {
		return EvtCtgId;
	}

	public void setEvtCtgId(String evtCtgId) {
		EvtCtgId = evtCtgId;
	}

	public String getEvtTrg() {
		return EvtTrg;
	}

	public void setEvtTrg(String evtTrg) {
		EvtTrg = evtTrg;
	}

	public String getEvtPhone() {
		return EvtPhone;
	}

	public void setEvtPhone(String evtPhone) {
		EvtPhone = evtPhone;
	}

	public String getEvtTrgDate() {
		return EvtTrgDate;
	}

	public void setEvtTrgDate(String evtTrgDate) {
		EvtTrgDate = evtTrgDate;
	}

	public String getEvtCtgNm() {
		return EvtCtgNm;
	}

	public void setEvtCtgNm(String evtCtgNm) {
		EvtCtgNm = evtCtgNm;
	}

	@Override
	public String toString() {
		return "EventVO [EvtIdx=" + EvtIdx + ", EvtNm=" + EvtNm + ", StDate=" + StDate + ", EndDate=" + EndDate
				+ ", EvtSt=" + EvtSt + ", EvtFileUrl=" + EvtFileUrl + ", EvtCtgId=" + EvtCtgId + ", EvtTrg=" + EvtTrg
				+ ", EvtPhone=" + EvtPhone + ", EvtTrgDate=" + EvtTrgDate + ", EvtCtgNm=" + EvtCtgNm + "]";
	}
}
