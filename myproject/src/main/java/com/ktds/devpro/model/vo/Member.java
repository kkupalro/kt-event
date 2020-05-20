package com.ktds.devpro.model.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails  {
	
	private String name;
	private String id;
	private String password;
	private String phone;
	private String email;
	private String paySystem;
	private String membership;
	private int mPoint;
	private double dataSize;
	public Member() {	
	}
	public Member(String name, String id, String password, String phone, String email, String paySystem,
			String membership, int mPoint, double dataSize) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.paySystem = paySystem;
		this.membership = membership;
		this.mPoint = mPoint;
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
	public String getPaySystem() {
		return paySystem;
	}
	public void setPaySystem(String paySystem) {
		this.paySystem = paySystem;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public int getmPoint() {
		return mPoint;
	}
	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
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
				+ email + ", paySystem=" + paySystem + ", membership=" + membership + ", mPoint=" + mPoint
				+ ", dataSize=" + dataSize + "]";
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.name;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
}
