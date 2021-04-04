package org.ddangelorb.jsbpstgisservice.users.repository;

import org.ddangelorb.jsbpstgisservice.users.model.Users;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UsersRepository extends CrudRepository<Users, Integer> {
	@Query(value = "SELECT u FROM Users u WHERE u.email = ?1", nativeQuery = true)
	Users findByEmail(String email);
}
