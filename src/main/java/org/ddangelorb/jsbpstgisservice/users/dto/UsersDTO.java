package org.ddangelorb.jsbpstgisservice.users.dto;

import org.ddangelorb.jsbpstgisservice.users.model.Users;

import lombok.Getter;

@Getter
public class UsersDTO {
	private String email;
	private String firstname;
	private String surname;
	private String avatar;
	private Integer active;

	public Users transformToObject(String email, String firstname, String surname, String avatar, Integer active) {
		return new Users(email, firstname, surname, avatar, active);
	}
}
