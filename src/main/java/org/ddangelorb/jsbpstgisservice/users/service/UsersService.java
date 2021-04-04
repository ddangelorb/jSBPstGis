package org.ddangelorb.jsbpstgisservice.users.service;

import org.ddangelorb.jsbpstgisservice.users.model.Users;
import org.ddangelorb.jsbpstgisservice.users.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UsersService {
	@Autowired
	private UsersRepository usersRepository;
	
	public Users findByEmail(String email) {
		return usersRepository.findByEmail(email);
	}
}
