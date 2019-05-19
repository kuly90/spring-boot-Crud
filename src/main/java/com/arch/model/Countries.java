package com.arch.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "countries")
public class Countries implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "COUNTRY_ID")
    private String countryId;
    
    @Column(name = "COUNTRY_NAME")
    private String countryName;

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
    
    
}
