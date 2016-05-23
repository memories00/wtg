package theme;

import java.util.Date;
public class ThemeDTO {
	private int no;
	private String name;
	private String subject;
	private String content;
	private String file_orgname;
	private String file_savname;
	private int readhit;
	private int good;
	private int hate;
	private Date regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

    

}
