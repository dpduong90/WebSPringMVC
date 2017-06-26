package com.example.service;

import java.util.List;

import com.example.model.User;


public interface UserService {
	
	User findById(int id);
	
	User findByUsername(String username);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteByUsername(String username);

	String changePassword(String username, String oldPassword, String newPassword);
	
	List<User> findAllUsers(); 
	
	boolean isUserUsernameUnique(Integer id, String username);

}