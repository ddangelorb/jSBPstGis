package org.ddangelorb.jsbpstgisservice.users.repository;

import org.ddangelorb.jsbpstgisservice.users.model.Users;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UsersRepository extends CrudRepository<Users, Integer> {
	@Query("SELECT u FROM Users u WHERE u.email = ?1")
	Users findByEmail(String email);
}
