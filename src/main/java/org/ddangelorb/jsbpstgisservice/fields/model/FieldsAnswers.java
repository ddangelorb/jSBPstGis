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
	private Integer idUsersInformer;
	private String value;
	private String dtfilling;
	private float latitude;
	private float longitude;
	private Integer active;
	
	public FieldsAnswers(Integer idfields, Integer idUsersInformer, String value, String dtfilling, float latitude, float longitude) {
		this.idfields = idfields;
		this.idUsersInformer = idUsersInformer;
		this.value = value;
		this.dtfilling = dtfilling;
		this.latitude = latitude;
		this.longitude = longitude;
	}
}
