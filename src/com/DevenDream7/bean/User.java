package com.DevenDream7.bean;

public class User {
	private String userId;
	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String password;
	private String refrenceid;
	private int level;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [firstName=" + this.getFirstName() + ", lastName=" + this.getLastName()
				+ ", phone=" + this.getPhone() + ", email="
				+ this.getEmail() + "]";
	}
	public User(String firstName, String lastName, String phone,
			String password, String email) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.password = password;
		this.email = email;
		this.refrenceid = "root";
	}
	
	
	public User(String firstName, String lastName, String phone, String email,
			String password, String refrenceid) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.refrenceid = refrenceid;
	}
	public User(String userId, String firstName, String lastName, String phone,
			String email, String password,String refrenceid) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.password = password;
		this.email = email;
		this.refrenceid = refrenceid;
	}
	public String getRefrenceid() {
		return refrenceid;
	}
	public void setRefrenceid(String refrenceid) {
		this.refrenceid = refrenceid;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	

}
