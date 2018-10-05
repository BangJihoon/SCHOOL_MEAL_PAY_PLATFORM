package user;

public class UserDTO {

	private String userID;
	private String userPW;
	private String school;
	private String snum;
	private String name;
	private String email;
	private String birth;
	private String phone;
	private boolean admin;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	public boolean getAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}	
	
	public UserDTO() {
	}
	
	public UserDTO(String userID,String userPW,String school,String snum,String name,String email,String birth,String phone,boolean admin) {
		this.userID = userID;
		this.userPW = userPW;
		this.school = school;
		this.snum = snum;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.admin = admin;
		
	}
}
