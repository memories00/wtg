package login.bean;

import java.sql.Timestamp;

public class JoinDTO {

	private String id;
	private String nickname;
	private String profile;
	private String thumbnail;
	private Timestamp reg;
	
	public void setId (String id) { this.id = id; }
	public void setNickname (String nickname) { this.nickname = nickname; }
	public void setProfile (String profile) { this.profile = profile; }
	public void setThumbnail (String thumbnail) { this.thumbnail = thumbnail; }
	public void setReg (Timestamp reg) { this.reg = reg; }
	
	public String getId() { return id; }
	public String getNickname() { return nickname; }
	public String getProfile() { return profile; }
	public String getThumbnail() { return thumbnail; }
	public Timestamp getReg() { return reg; }
}
