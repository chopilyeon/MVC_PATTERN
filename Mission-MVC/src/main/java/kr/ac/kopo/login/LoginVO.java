package kr.ac.kopo.login;

public class LoginVO {
	private String id;
	private String password;
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", name=" + name + ", type=" + type + "]";
	}
	private String name;
	private String type; //"S" 관리자, "U" 일반 사용자
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public LoginVO() {
		super();
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public LoginVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	public LoginVO(String id, String password, String name, String type) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	

}
