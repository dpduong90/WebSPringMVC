package com.example.dao;

import java.util.List;

import com.example.model.User;


public interface UserDao {

	User findById(int id);
	
	User findByUsername(String username);
	
	void save(User user);
	
	void deleteByUsername(String username);
	
	List<User> findAllUsers();

	List<User> findUsers(String username, String creater, String createDate);
}

