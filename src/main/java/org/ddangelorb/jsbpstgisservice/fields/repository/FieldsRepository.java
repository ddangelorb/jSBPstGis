package org.ddangelorb.jsbpstgisservice.fields.repository;

import org.ddangelorb.jsbpstgisservice.fields.model.Fields;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface FieldsRepository extends CrudRepository<Fields, Integer> {
    @Query(value = "SELECT f FROM Fields f INNER JOIN FormFields ff on f.Id = ff.IdFields INNER JOIN Forms fo ON ff.IdForms = fo.Id WHERE fo.Code LIKE %?1", nativeQuery = true)
    Iterable<Fields> findAllByFormCode(String formcode);
}