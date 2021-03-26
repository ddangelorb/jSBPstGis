package org.ddangelorb.jsbpstgisservice.fields.repository;

import java.util.List;

import org.ddangelorb.jsbpstgisservice.fields.model.Fields;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface FieldsRepository extends CrudRepository<Fields, Integer> {
    @Query("FROM Fields f INNER JOIN FormFields ff on f.Id = ff.IdFields INNER JOIN Forms fo ON ff.IdForms = fo.Id WHERE fo.Code LIKE =:formcode")
    List<Fields> findAllByFormCode(@Param("formcode") String formcode);
}