package org.ddangelorb.jsbpstgisservice.fields.service;

import java.util.List;

import org.ddangelorb.jsbpstgisservice.fields.model.Fields;
import org.ddangelorb.jsbpstgisservice.fields.repository.FieldsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FieldsService {
	@Autowired
	private FieldsRepository fieldsRepository;
	
	public Fields findById(Integer id) {
		return fieldsRepository.findById(id).orElse(null);
	}
	
	public List<Fields> findAllByFormCode(String formcode) {
		return fieldsRepository.findAllByFormCode(formcode);
	}
}
