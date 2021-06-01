package org.ddangelorb.jsbpstgisservice.users.dto;

import org.ddangelorb.jsbpstgisservice.users.model.Users;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
public class UsersResponseDTO {
	private Integer id;
	private String email;
	private String firstname;
	private String surname;
	private String avatar;

    public static UsersResponseDTO transformIntoDTO(Users user) {
        return new UsersResponseDTO(user.getId(), user.getEmail(), user.getFirstname(), user.getSurname(), user.getAvatar());
    }	
}
