package com.example.dao;

import java.util.List;

import com.example.model.Role;


public interface RoleDao {

	List<Role> findAll();
	
	Role findByType(String type);
	
	Role findById(int id);
}
