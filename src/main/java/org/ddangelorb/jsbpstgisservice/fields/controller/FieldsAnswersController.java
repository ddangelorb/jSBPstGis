package org.ddangelorb.jsbpstgisservice.fields.controller;

import java.util.ArrayList;
import java.util.List;

import org.ddangelorb.jsbpstgisservice.fields.dto.FieldsAnswersDTO;
import org.ddangelorb.jsbpstgisservice.fields.model.FieldsAnswers;
import org.ddangelorb.jsbpstgisservice.fields.service.FieldsAnswersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/fieldsanswers")
public class FieldsAnswersController {
	@Autowired 
	 private FieldsAnswersService fieldsAnswersService;
	
	/*@PostMapping
	public ResponseEntity<Void> add(String formcode,FieldsAnswersDTO dto) {
		List<FieldsAnswers> listFieldsAnswers = new ArrayList<FieldsAnswers>();
		listFieldsAnswers.add(dto.transformToObject());
		fieldsAnswersService.addAll(formcode, listFieldsAnswers);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}*/
	
	@PostMapping
	public ResponseEntity<Void> addAll(String formcode, List<FieldsAnswersDTO> listDTO) {
		List<FieldsAnswers> listFieldsAnswers = new ArrayList<FieldsAnswers>();
		for (FieldsAnswersDTO dto : listDTO) {
			listFieldsAnswers.add(dto.transformToObject());
		}
		
		fieldsAnswersService.addAll(formcode, listFieldsAnswers);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@GetMapping
	public ResponseEntity<Iterable<FieldsAnswers>> findAllByUserInformer(Integer idUserInformer) {
		return ResponseEntity.ok(fieldsAnswersService.findAllByUserInformer(idUserInformer));
	}
}
