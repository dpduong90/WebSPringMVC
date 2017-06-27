package com.example.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.example.model.Role;
import com.example.service.RoleService;

@Component
public class RoleToUserConverter implements Converter<Object, Role>{

	@Autowired
	RoleService userProfileService;

	public Role convert(Object element) {
		Integer id = Integer.parseInt((String)element);
		Role profile= userProfileService.findById(id);
		return profile;
	}
	
}