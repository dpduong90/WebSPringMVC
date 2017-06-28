package com.example.model;

import java.io.Serializable;

public enum RoleType implements Serializable{
	ADMIN("ADMIN");
	
	String roleType;
	
	private RoleType(String roleType){
		this.roleType = roleType;
	}
	
	public String getRoleType(){
		return roleType;
	}
	
}
