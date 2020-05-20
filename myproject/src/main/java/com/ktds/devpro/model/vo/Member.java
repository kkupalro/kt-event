package com.ktds.devpro.model.vo;

public class Member {

	private String name;
	private String id;
	private String password;
	private String phone;
	private String email;
	private String product;
	private String membership;
	private int custPoint;
	private double dataSize;

	public Member() {
	}
	public Member(String name, String id, String password, String phone, String email, String product,
			String membership, int custPoint, double dataSize) {

		this.name = name;
		this.id = id;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.product = product;
		this.membership = membership;
		this.custPoint = custPoint;
		this.dataSize = dataSize;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}
	public int getCustPoint() {
		return custPoint;
	}
	public void setCustPoint(int custPoint) {
		this.custPoint = custPoint;
	}

	public double getDataSize() {
		return dataSize;
	}

	public void setDataSize(double dataSize) {
		this.dataSize = dataSize;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", product=" + product + ", membership=" + membership + ", custPoint=" + custPoint
				+ ", dataSize=" + dataSize + "]";
	}

}
