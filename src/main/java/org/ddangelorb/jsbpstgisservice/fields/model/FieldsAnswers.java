package org.ddangelorb.jsbpstgisservice.fields.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class FieldsAnswers {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer idfields;
	private String value;
	private String dtfilling;
	private Integer active;
	
	public FieldsAnswers(Integer idfields, String value, String dtfilling) {
		this.idfields = idfields;
		this.value = value;
		this.dtfilling = dtfilling;
	}
}
