package org.ddangelorb.jsbpstgisservice.users.controller;

import org.ddangelorb.jsbpstgisservice.users.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ddangelorb.jsbpstgisservice.users.model.Users;

@RestController
@RequestMapping(path="/users")
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@GetMapping
	public ResponseEntity<Users> findByEmail(String email) {
		return ResponseEntity.ok(usersService.findByEmail(email));
	}
}
