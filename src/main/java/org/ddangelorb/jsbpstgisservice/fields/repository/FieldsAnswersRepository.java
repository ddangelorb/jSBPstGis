package org.ddangelorb.jsbpstgisservice.fields.repository;

import org.ddangelorb.jsbpstgisservice.fields.model.FieldsAnswers;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FieldsAnswersRepository extends CrudRepository<FieldsAnswers, Integer> {
    @Query(value = "SELECT f FROM FieldsAnswers f WHERE f.IdUsersInformer = ?1", nativeQuery = true)
    Iterable<FieldsAnswers> findAllByUserInformer(Integer idUserInformer);
}
