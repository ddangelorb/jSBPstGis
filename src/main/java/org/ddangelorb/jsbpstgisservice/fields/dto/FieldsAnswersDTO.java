package org.ddangelorb.jsbpstgisservice.fields.dto;

import org.ddangelorb.jsbpstgisservice.fields.model.FieldsAnswers;

import lombok.Getter;

@Getter
public class FieldsAnswersDTO {
	private Integer idfields;
	private Integer idUsersInformer;
	private String value;
	private String dtfilling;
	private float latitude;
	private float longitude;

	public FieldsAnswers transformToObject() {
		return new FieldsAnswers(this.idfields, this.idUsersInformer, this.value, this.dtfilling, this.latitude, this.longitude);
	}
}
