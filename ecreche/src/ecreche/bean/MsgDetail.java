package ecreche.bean;
import java.util.*;
public class MsgDetail {
	private String msgid;
	private String subject;
	private String msg;
	private String senderid;
	private String receiverid;
	private Date msgdate;
	
	
	public Date getMsgdate() {
		return msgdate;
	}
	public void setMsgdate(Date msgdate) {
		this.msgdate = msgdate;
	}
	private Boolean rstatus;
	private Boolean sstatus;
	public String getMsgid() {
		return msgid;
	}
	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSenderid() {
		return senderid;
	}
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}
	public String getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}
	public Boolean getRstatus() {
		return rstatus;
	}
	public void setRstatus(Boolean rstatus) {
		this.rstatus = rstatus;
	}
	public Boolean getSstatus() {
		return sstatus;
	}
	public void setSstatus(Boolean sstatus) {
		this.sstatus = sstatus;
	}
}
