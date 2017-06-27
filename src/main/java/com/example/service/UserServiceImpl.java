package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.UserDao;
import com.example.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	@Autowired
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findByUsername(String username) {
		User user = dao.findByUsername(username);
		return user;
	}

	public void saveUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao.save(user);
	}

	public void updateUser(User user) {
		User entity = dao.findById(user.getId());
		if (entity != null) {
			entity.setUsername(user.getUsername());
			if (!passwordEncoder.matches(user.getPassword(), entity.getPassword())) {
				entity.setPassword(passwordEncoder.encode(user.getPassword()));
			}
			entity.setFirstName(user.getFirstName());
			entity.setLastName(user.getLastName());
			entity.setEmail(user.getEmail());
			entity.setRoles(user.getRoles());
			entity.setPhone(user.getPhone());
			entity.setAddress(user.getAddress());
		}
	}

	public void deleteByUsername(String username) {
		dao.deleteByUsername(username);
	}

	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	public boolean isUserUsernameUnique(Integer id, String username) {
		User user = findByUsername(username);
		return (user == null || ((id != null) && (user.getId() == id)));
	}

	@Override
	public String changePassword(String username, String oldPassword, String newPassword) {
		User entity = dao.findByUsername(username);
		if (entity != null) {
			if (!passwordEncoder.matches(oldPassword, entity.getPassword())) {
				return "Old password wrong! Please try Again";
			} else {
				entity.setPassword(passwordEncoder.encode(newPassword));
				return "";
			}
		}
		return "User not found!";
	}
}
