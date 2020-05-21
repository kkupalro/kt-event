package com.ktds.devpro.model.vo;

public class EventVO {

	
	public EventVO(int evtIdx, String evtNm, String stDate, String endDate, int evtSt, String evtFileUrl,
			int evtCtgId, String evtTrg, String evtPhone, String evtTrgDate) {
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
	}
	
	public EventVO() {
		
	}
	
	int EvtIdx;
	String EvtNm;
	String StDate;
	String EndDate;
	int EvtSt;
	String EvtFileUrl;
	int EvtCtgId;
	String EvtTrg;
	String EvtPhone;
	String EvtTrgDate;
	
//	int EvtId;
//	String EvtNm;
//	String StDate;
//	String EndDate;
//	String EvtSt;
//	String EvtFileUrl;
//	String EvtCtgId;
//	String EvtTrg;
//	String EvtPhone;
//	String EvtTrgDate;
	
	
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
	public int getEvtSt() {
		return EvtSt;
	}
	public void setEvtSt(int EvtSt) {
		EvtSt = EvtSt;
	}

	public String getEvtFileUrl() {
		return EvtFileUrl;
	}

	public void setEvtFileUrl(String evtFileUrl) {
		EvtFileUrl = evtFileUrl;
	}
	public int getEvtCtgId() {
		return EvtCtgId;
	}
	public void setEvtCtgId(int evtCtgId) {
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
		return "EventListVo [EvtIdx=" + EvtIdx + ", EvtNm=" + EvtNm + ", StDate=" + StDate + ", EndDate=" + EndDate
				+ ", EvtSt=" + EvtSt + ", EvtFileUrl=" + EvtFileUrl + ", EvtCtgId=" + EvtCtgId + ", EvtTrg=" + EvtTrg
				+ ", EvtPhone=" + EvtPhone + ", EvtTrgDate=" + EvtTrgDate + "]";
	}
	
}
