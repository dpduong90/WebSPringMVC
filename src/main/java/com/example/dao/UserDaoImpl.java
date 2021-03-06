package com.example.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.model.User;



@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	public User findById(int id) {
		User user = getByKey(id);
		if(user!=null){
			Hibernate.initialize(user.getRoles());
		}
		return user;
	}

	public User findByUsername(String username) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", username));
		User user = (User)crit.uniqueResult();
		if(user!=null){
			Hibernate.initialize(user.getRoles());
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
		criteria.add(Restrictions.ne("username", "admin"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<User> users = (List<User>) criteria.list();
		return users;
	}

	public void save(User user) {
		persist(user);
	}

	public void deleteByUsername(String username) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", username));
		User user = (User)crit.uniqueResult();
		delete(user);
	}

	@SuppressWarnings("unchecked")
	public List<User> findUsers(String username, String creater, String createDate) {
		try {
			
		    Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
			criteria.add(Restrictions.ne("username", "admin"));
			if(!username.trim().equals("")) {
				criteria.add(Restrictions.eq("username", username));
			}
			if(!creater.trim().equals("")) {
				criteria.add(Restrictions.eq("creater", creater));
			}
			if(!createDate.trim().equals("")){
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			    Date minDate = formatter.parse(createDate);
			    Date maxDate = new Date(minDate.getTime() + TimeUnit.DAYS.toMillis(1));
			    criteria.add(Restrictions.sqlRestriction("create_at between '" + createDate + " 00:00:00' and '" + formatter.format(maxDate) + " 00:00:00'"));
			}
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			List<User> users = (List<User>) criteria.list();
			return users;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}
