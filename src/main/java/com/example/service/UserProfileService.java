package com.example.service;

import java.util.List;

import com.example.model.Role;


public interface UserProfileService {

	Role findById(int id);

	Role findByType(String type);
	
	List<Role> findAll();
	
}
