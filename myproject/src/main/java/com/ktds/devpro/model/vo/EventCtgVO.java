package com.ktds.devpro.model.vo;

public class EventCtgVO {
	private int EvtCtgIdx;
	private String EvtCtgNm;
	
	
	
	public EventCtgVO(int evtCtgIdx, String evtCtgNm) {
		super();
		EvtCtgIdx = evtCtgIdx;
		EvtCtgNm = evtCtgNm;
	}
	
	public EventCtgVO() {
		
	}

	public int getEvtCtgIdx() {
		return EvtCtgIdx;
	}
	public void setEvtCtgIdx(int evtCtgIdx) {
		EvtCtgIdx = evtCtgIdx;
	}
	public String getEvtCtgNm() {
		return EvtCtgNm;
	}
	public void setEvtCtgNm(String evtCtgNm) {
		EvtCtgNm = evtCtgNm;
	}

	@Override
	public String toString() {
		return "EventCtgVO [EvtCtgIdx=" + EvtCtgIdx + ", EvtCtgNm=" + EvtCtgNm + "]";
	}
	
	
}
