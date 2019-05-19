package com.arch.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.arch.model.Countries;

@Repository
public interface CountriesRepository extends CrudRepository<Countries, String>{
	Countries findByCountryId(String countryId);
}
