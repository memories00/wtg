package login.bean;

import java.sql.Timestamp;

public class LoginDTO {

	private String id;
	private Timestamp reg;
	
	public void setId (String id) { this.id = id; }
	public void setReg (Timestamp reg) { this.reg = reg; }
	
	public String getId() { return id; }
	public Timestamp getReg() { return reg; }
}
