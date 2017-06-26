package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.RoleDao;
import com.example.model.Role;


@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService{
	
	@Autowired
	RoleDao dao;
	
	public Role findById(int id) {
		return dao.findById(id);
	}

	public Role findByType(String type){
		return dao.findByType(type);
	}

	public List<Role> findAll() {
		return dao.findAll();
	}
}
