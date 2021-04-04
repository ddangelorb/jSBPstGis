package org.ddangelorb.jsbpstgisservice.fields.service;

import java.util.List;

import org.ddangelorb.jsbpstgisservice.fields.model.Fields;
import org.ddangelorb.jsbpstgisservice.fields.model.FieldsAnswers;
import org.ddangelorb.jsbpstgisservice.fields.repository.FieldsAnswersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FieldsAnswersService {
	  @Autowired
	  private FieldsAnswersRepository fieldsAnswersRepository;
	  
	  @Autowired
	  private FieldsService fieldsService;

	  
	  public void addAll(String formcode, List<FieldsAnswers> listFieldsAnswers) {
		  //check if all fields belong to the form
		  Iterable<Fields> formFields = fieldsService.findAllByFormCode(formcode);
		  //check here if the formFields match with listFieldsAnswers
		  //https://www.tutorialspoint.com/how-to-compare-two-arrays-in-java
		  
		  for (FieldsAnswers fieldsAnswers : listFieldsAnswers) {
			  if (isValid(fieldsAnswers)) {
				  fieldsAnswersRepository.save(fieldsAnswers);
			  }
			  else {
			  //REST API Error here
			  }
		  }
	  }
	  
	  public FieldsAnswers findById(Integer id) {
		  return fieldsAnswersRepository.findById(id).orElse(null);
	  }
	  
	  public Iterable<FieldsAnswers> findAllByUserInformer(Integer idUserInformer) {
		  //TODO: validate idUserInformer here ...
		  return fieldsAnswersRepository.findAllByUserInformer(idUserInformer);
	  }
	  
	  private boolean isValid(FieldsAnswers fieldsAnswers) {
		  //does the idField exists?
		  Fields field = fieldsService.findById(fieldsAnswers.getIdfields());
		  if (field == null) {
			  return false;
		  }
			  
		  //does the dtfilling is a valid date/time?
		  //if ()
		  
		  return true;
	  }
}
