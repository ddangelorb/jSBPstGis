package org.ddangelorb.jsbpstgisservice.fields.dto;

import org.ddangelorb.jsbpstgisservice.fields.model.FieldsAnswers;

import lombok.Getter;

@Getter
public class FieldsAnswersDTO {
	private Integer idfields;
	private String value;
	private String dtfilling;
	
	public FieldsAnswers transformToObject() {
		return new FieldsAnswers(this.idfields, this.value, this.dtfilling);
	}
}
