package com.ktds.devpro.model.vo;

public class EventVO {
	int EvtId;
	String EvtNm;
	String StDate;
	String EndDate;
	String EvtSt;
	String EvtFileUrl;
	String EvtCtgId;
	String EvtTrg;
	String EvtPhone;
	String EvtTrgDate;
	
	public EventVO(int evtId, String evtNm, String stDate, String endDate, String evtSt, String evtFileUrl,
			String evtCtgId, String evtTrg, String evtPhone, String evtTrgDate) {
		super();
		EvtId = evtId;
		EvtNm = evtNm;
		StDate = stDate;
		EndDate = endDate;
		EvtSt = evtSt;
		EvtFileUrl = evtFileUrl;
		EvtCtgId = evtCtgId;
		EvtTrg = evtTrg;
		EvtPhone = evtPhone;
		EvtTrgDate = evtTrgDate;
	}
	
	public EventVO() {
		
	}
	public int getEvtId() {
		return EvtId;
	}

	public void setEvtId(int evtId) {
		EvtId = evtId;
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

	@Override
	public String toString() {
		return "EventListVo [EvtId=" + EvtId + ", EvtNm=" + EvtNm + ", StDate=" + StDate + ", EndDate=" + EndDate
				+ ", EvtSt=" + EvtSt + ", EvtFileUrl=" + EvtFileUrl + ", EvtCtgId=" + EvtCtgId + ", EvtTrg=" + EvtTrg
				+ ", EvtPhone=" + EvtPhone + ", EvtTrgDate=" + EvtTrgDate + "]";
	}
	
}
