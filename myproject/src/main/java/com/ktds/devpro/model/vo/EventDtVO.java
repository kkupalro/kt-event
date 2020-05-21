package com.ktds.devpro.model.vo;

public class EventDtVO {

	private int EvtDtIdx;
	private int EvtIdx;
	private String ResData;
	private String DataType;
	public int getEvtDtIdx() {
		return EvtDtIdx;
	}
	public void setEvtDtIdx(int evtDtIdx) {
		EvtDtIdx = evtDtIdx;
	}
	public int getEvtIdx() {
		return EvtIdx;
	}
	public void setEvtIdx(int evtIdx) {
		EvtIdx = evtIdx;
	}
	public String getResData() {
		return ResData;
	}
	public void setResData(String resData) {
		ResData = resData;
	}
	public String getDataType() {
		return DataType;
	}
	public void setDataType(String dataType) {
		DataType = dataType;
	}
	@Override
	public String toString() {
		return "EventDtVO [EvtDtIdx=" + EvtDtIdx + ", EvtIdx=" + EvtIdx + ", ResData=" + ResData + ", DataType="
				+ DataType + "]";
	}
	public EventDtVO(int evtDtIdx, int evtIdx, String resData, String dataType) {
		super();
		EvtDtIdx = evtDtIdx;
		EvtIdx = evtIdx;
		ResData = resData;
		DataType = dataType;
	}
	public EventDtVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
