package org.ddangelorb.jsbpstgisservice.users.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String email;
	private String firstname;
	private String surname;
	private String avatar;
	private Integer active;
	
	public Users(String email, String firstname, String surname, String avatar, Integer active) {
		this.email = email;
		this.firstname = firstname;
		this.surname = surname;
		this.avatar = avatar;
		this.active = active;
	}
}
