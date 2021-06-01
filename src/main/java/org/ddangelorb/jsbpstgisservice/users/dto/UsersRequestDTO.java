package org.ddangelorb.jsbpstgisservice.users.dto;

import org.ddangelorb.jsbpstgisservice.users.model.Users;

import lombok.Getter;

@Getter
public class UsersRequestDTO {
	private String email;
	private String password;
	
	public Users transformToObject() {
		return new Users(this.email);
	}

}
