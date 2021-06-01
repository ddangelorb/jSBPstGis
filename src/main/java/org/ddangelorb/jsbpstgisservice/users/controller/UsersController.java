package org.ddangelorb.jsbpstgisservice.users.controller;

import org.ddangelorb.jsbpstgisservice.users.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ddangelorb.jsbpstgisservice.users.dto.UsersRequestDTO;
import org.ddangelorb.jsbpstgisservice.users.dto.UsersResponseDTO;
import org.ddangelorb.jsbpstgisservice.users.model.Users;

@RestController
@RequestMapping(path="/users")
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@GetMapping
	public ResponseEntity<UsersResponseDTO> findByEmail(@RequestBody UsersRequestDTO dto) {
		//TODO: should check login/pwd 
		Users user = usersService.findByEmail(dto.getEmail());
		return ResponseEntity.ok(UsersResponseDTO.transformIntoDTO(user));
	}
}
