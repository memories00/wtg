package theme;

import java.util.Date;

public class ReportDTO {
	private int num;
	private String id;
	private String subject;
	private int no;
	private String content;
	private Date regdate;
	private int process;
	
	
	
	public int getProcess() {
		return process;
	}
	public void setProcess(int process) {
		this.process = process;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
}
