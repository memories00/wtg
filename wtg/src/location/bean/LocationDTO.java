package location.bean;

public class LocationDTO {
	private int mem_num;
	private String start0;
	private String pass1;
	private String pass2;
	private String pass3;
	private String end4;
	
	public void setMem_num(int mem_num) { this.mem_num=mem_num; }
	public void setStart0(String start0) { this.start0 = start0; }
	public void setPass1(String pass1) { this.pass1 = pass1;}
	public void setPass2(String pass2) {this.pass2 = pass2;	}
	public void setPass3(String pass3) {this.pass3 = pass3;	}
	public void setEnd4(String end4) {	this.end4 = end4;	}
	
	public int getMem_num() { return mem_num; }
	public String getStart0() { return start0;}
	public String getPass1() {  return pass1; 	}
	public String getPass2() {	return pass2;	}
	public String getPass3() {	return pass3;	}
	public String getEnd4() {	return end4;	}
}
